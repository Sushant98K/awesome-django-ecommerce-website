from django.shortcuts import render, redirect, HttpResponse
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils.html import strip_tags
import requests
import uuid
from django.conf import settings
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.hashers import make_password, check_password
from django.contrib.auth import authenticate, login, logout
from .models import *



def userlogin(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        try:
            # Get the user with the matching email
            user = User.objects.get(email=email)

            # Authenticate using the username (since Django's authenticate uses username)
            user = authenticate(request, username=user.username, password=password)

            if user is not None:
                login(request, user)  # Log the user in
                # Store success message in session
                request.session['toast_message'] = f"Hello, {user.username}! Welcome back!"
                return redirect('home')  # Redirect to the home page
            
            else:
                messages.error(request, "Invalid email or password!")
                return redirect('login')

        except User.DoesNotExist:
            messages.error(request, "No account found with this email!")
            return redirect('login')
    toast_message = request.session.pop('toast_message', '')  # Retrieve and clear message from session
    return render(request, 'userlogin.html', locals())


def userregister(request):
    
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        
        # Check if the email already exists
        if User.objects.filter(username=username).exists():
            messages.error(request, "username is already registered!")
            return redirect('register')
        
        
        # Check if the email already exists
        if User.objects.filter(email=email).exists():
            messages.error(request, "Email is already registered!")
            return redirect('register')

        # Create the user
        user = User.objects.create(
            username=username, 
            email=email,
            password=make_password(password),  # Hash the password
        )
        user.save()
        messages.success(request, "Account created successfully!")
        request.session['toast_message'] = "Account created successfully!"
        return redirect('login')
    
    return render(request, 'userregister.html')


def resetpass(request):
    if request.method == 'POST':
        email = request.POST.get('email')

        if not email:
            messages.error(request, "Email field is required.")
            return redirect('resetpass')

        if not User.objects.filter(email=email).exists():
            messages.error(request, "Email does not exist.")
            return redirect('resetpass')

        user = User.objects.get(email=email)
        token = str(uuid.uuid4())

        # Save or update ResetPass token
        ResetPass.objects.update_or_create(user=user, defaults={'forget_pass_token': token})

        reset_link = f"http://127.0.0.1:8000/user/passreset/{token}/"
        subject = 'Password Reset Request'
        context = {'user': user, 'reset_link': reset_link}

        # Render email content
        html_message = render_to_string('emails/reset_password.html', context)
        plain_message = strip_tags(html_message)

        # Send email using Mailgun
        response = requests.post(
            settings.MAILGUN_API_URL + "/messages",
            auth=("api", settings.MAILGUN_API_KEY),
            data={
                "from": settings.MAILGUN_FROM_EMAIL,
                "to": [user.email],
                "subject": subject,
                "text": plain_message,
                "html": html_message,
            }
        )

        if response.status_code == 200:
            messages.success(request, "A reset link has been sent to your email.")
            user_email = email
            return render(request, 'send_confirm.html', {'user_email': user_email})
        else:
            messages.error(request, "Failed to send the reset email. Please try again later.")
            return redirect('resetpass')

    return render(request, 'resetpass.html')












def passreset(request, token):
    try:
        reset_entry = ResetPass.objects.get(forget_pass_token=token)
        user = reset_entry.user

        if request.method == 'POST':
            new_password = request.POST.get('newpass1')
            confirm_password = request.POST.get('newpass2')

            if new_password != confirm_password:
                messages.error(request, "Passwords do not match.")
                return redirect(f'/user/passreset/{token}/')

            user.set_password(new_password)
            user.save()

            # Delete the token after successful reset
            reset_entry.delete()

            messages.success(request, "Your password has been reset successfully.")
            return redirect('login')

    except ResetPass.DoesNotExist:
        messages.error(request, "Invalid or expired reset link.")
        return redirect('resetpass')

    return render(request, 'passreset.html', {'token': token})






def userLogout(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            logout(request)
            request.session['toast_message'] = "You have successfully logged out."
            return redirect('login')
    return redirect('login')




# def send_test_email():
#     subject = "Test Email from Django with SendGrid"
#     message = "This is a test email sent using SendGrid in Django."
#     from_email = "zamazor.ecom@gmail.com"  # Replace with your verified sender email
#     recipient_list = ["sushant98k@gmail.com"]

#     send_mail(subject, message, from_email, recipient_list)
    
    
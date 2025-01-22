from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import *
from django.db.models import ObjectDoesNotExist



def profileDetails(request):
    user = request.user
    try:
        profile = Profile.objects.get(user=user)
    except Profile.DoesNotExist:
        profile = Profile(user=user)
    toast_message = request.session.pop('toast_message', '')
    return render(request, 'profilepage.html', locals())

@login_required
def editProfile(request):
    user = request.user  # Get the logged-in user
    
    # Get or create the Profile for the user
    try:
        profile = Profile.objects.get(user=user)
    except Profile.DoesNotExist:
        profile = Profile(user=user)
    
    if request.method == "POST":
        # Get data from the form
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        phone = request.POST['phone']
        address_line1 = request.POST['address_line1']
        address_line2 = request.POST['address_line2']
        country = request.POST['country']
        city = request.POST['city']
        state = request.POST['state']
        zip_code = request.POST['zip_code']
        date_of_birth = request.POST['date_of_birth']
        shipping_address = request.POST['shipping_address']
        billing_address = request.POST.get('billing_address', '')

        # If billing address is empty, use shipping address
        if not billing_address:
            billing_address = shipping_address

        # Update user details
        user.first_name = first_name
        user.last_name = last_name
        user.save()

        # Update profile details
        
        profile.first_name = first_name
        profile.last_name = last_name
        profile.phone = phone
        profile.address_line1 = address_line1
        profile.address_line2 = address_line2
        profile.country = country
        profile.city = city
        profile.state = state
        profile.zip_code = zip_code
        profile.date_of_birth = date_of_birth
        profile.shipping_address = shipping_address
        profile.billing_address = billing_address
        profile.save()

        # Redirect to the profile page with a success message
        request.session['toast_message'] = "Your profile has been updated successfully!"
        return redirect("user")  # This redirects to the 'user' URL (profile page)

    # Render the form with the current user and profile data
    context = {
        "user": user,
        "profile": profile,
    }
    return render(request, "editprofile.html", context)

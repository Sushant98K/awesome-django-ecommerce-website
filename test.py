import razorpay
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

dotenv_path = os.path.join(os.path.dirname(__file__), 'secret.env')
load_dotenv(dotenv_path)

RAZORPAY_KEY_ID = os.getenv('RAZORPAY_KEY_ID')
RAZORPAY_SECRET_KEY = os.getenv('RAZORPAY_SECRET_KEY')

print(f"RAZORPAY_KEY_ID: {RAZORPAY_KEY_ID}")
print(f"RAZORPAY_SECRET_KEY: {RAZORPAY_SECRET_KEY}")

try:
    client = razorpay.Client(auth=(RAZORPAY_KEY_ID, RAZORPAY_SECRET_KEY))
    print(client.payment.all())  # Test API call
except Exception as e:
    print(f"Error: {e}")

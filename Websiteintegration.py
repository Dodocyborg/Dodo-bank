from flask import Flask, render_template
import os

# Create Flask app
app = Flask(__name__)

# Directory to store static files (CSS, JS, images, etc.)
app.config['UPLOAD_FOLDER'] = 'static'

# Route for the main index page
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    # Create static folder if it doesn't exist
    if not os.path.exists(app.config['UPLOAD_FOLDER']):
        os.makedirs(app.config['UPLOAD_FOLDER'])

    # Run the web app
    app.run(debug=True)

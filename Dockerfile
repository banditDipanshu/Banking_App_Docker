# Base Python Image
FROM python:3.6.15

# Set up directories and add a non-root user
RUN mkdir -p /home/app && \
    adduser --disabled-password --gecos "" app && \
    chown -R app:app /home/app

# Switch to the app user
USER app

# Set the working directory
WORKDIR /home/app

# Copy application files
COPY --chown=app:app ./app /home/app/

# Install dependencies
RUN python3 -m venv /home/app/env && \
    /home/app/env/bin/pip install --upgrade pip && \
    /home/app/env/bin/pip install -r requirements.txt

# Database setup
RUN /home/app/env/bin/python manage.py makemigrations && \
    /home/app/env/bin/python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the Django development server
CMD ["/home/app/env/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]

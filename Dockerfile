FROM python:3.9.1-alpine
MAINTAINER Greg Taylor <gtaylor@gc-taylor.com>

# Upgrade pip and tools
RUN pip install --upgrade pip setuptools wheel

# Copy requirements and install dependencies
COPY *requirements.txt /opt/app/src/
RUN pip install -r /opt/app/src/requirements.txt

# Copy application source code
COPY . /opt/app/src/
WORKDIR /opt/app/src

# Install the application
RUN python setup.py install

# Expose the Flask port
EXPOSE 5000

# Run the application
CMD ["dronedemo"]

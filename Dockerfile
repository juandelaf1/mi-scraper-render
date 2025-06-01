FROM python:3.10-slim

# 1. Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libexpat1 \
    libgbm1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libx11-6 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# 2. Instalar Chrome desde paquete .deb descargado directamente
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y ./google-chrome-stable_current_amd64.deb \
    || apt-get install -f -y \  # Soluciona dependencias faltantes
    && rm google-chrome-stable_current_amd64.deb \
    && google-chrome --version

# 3. Instalar chromedriver compatible
RUN CHROME_VERSION=$(google-chrome --version | awk '{print $3}' | cut -d'.' -f1) \
    && wget -q https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION \
    && wget -q https://chromedriver.storage.googleapis.com/$(cat LATEST_RELEASE_$CHROME_VERSION)/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && mv chromedriver /usr/bin/chromedriver \
    && chmod +x /usr/bin/chromedriver \
    && rm chromedriver_linux64.zip LATEST_RELEASE_$CHROME_VERSION

WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

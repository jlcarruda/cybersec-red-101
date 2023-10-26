FROM parrotsec/security:latest

RUN apt update && apt upgrade -y
# GUI packages 
RUN apt install -y hicolor-icon-theme \
    libcanberra-gtk* libgl1-mesa-dri \
    libgl1-mesa-glx libpangox-1.0-0 \
    libpulse0 libv4l-0 fonts-symbola \
    ca-certificates openvpn firefox-esr xauth

RUN apt install -y openvpn firefox-esr xauth

# RUN xauth add token


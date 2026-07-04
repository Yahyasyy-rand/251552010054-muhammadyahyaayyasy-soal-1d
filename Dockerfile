FROM nginx:alpine

# Build arguments -> diisi dari docker-compose.yml
ARG FULL_NAME
ARG ROLE
ARG UNIVERSITY
ARG SEMESTER
ARG EMAIL
ARG LOCATION
ARG BIO
ARG SKILLS

# Copy file HTML & CSS asli (tidak diubah manual)
COPY html/ /usr/share/nginx/html/

# Ganti semua placeholder di index.html dengan data build args
# Pakai delimiter "|" pada sed supaya aman kalau ada "/" di data (mis. email/URL)
RUN sed -i \
    -e "s|FULL_NAME_PLACEHOLDER|${FULL_NAME}|g" \
    -e "s|ROLE_PLACEHOLDER|${ROLE}|g" \
    -e "s|UNIVERSITY_PLACEHOLDER|${UNIVERSITY}|g" \
    -e "s|SEMESTER_PLACEHOLDER|${SEMESTER}|g" \
    -e "s|EMAIL_PLACEHOLDER|${EMAIL}|g" \
    -e "s|LOCATION_PLACEHOLDER|${LOCATION}|g" \
    -e "s|BIO_PLACEHOLDER|${BIO}|g" \
    -e "s|SKILLS_PLACEHOLDER|${SKILLS}|g" \
    /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

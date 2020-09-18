#!/bin/sh

# sed -ir "s|\${PORT}|${PORT}|g" conf/httpd.conf \
#   && rm conf/httpd.confr

for alt in $(IFS=";"; echo ${ALTERNATE_RECORD_API_PORTALS}); do
  ALT_PORTAL_HOST=$(echo ${alt} | cut -f1 -d=)
  ALT_API_URL=$(echo ${alt} | cut -f2 -d=)

  echo "Configuring alternate portal \"${ALT_PORTAL_HOST}\" to use Record API \"${ALT_API_URL}\""

  cp conf/templates/alternate-record-api-portal-vhost.conf \
     conf/vhosts/alt.${ALT_PORTAL_HOST}.conf
  sed -ir "s|\${ALT_PORTAL_HOST}|${ALT_PORTAL_HOST}|g" \
      conf/vhosts/alt.${ALT_PORTAL_HOST}.conf
  sed -ir "s|\${ALT_API_URL}|${ALT_API_URL}|g" \
      conf/vhosts/alt.${ALT_PORTAL_HOST}.conf
done

rm conf/vhosts/*.confr

exec "$@"

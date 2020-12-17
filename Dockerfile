FROM registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:7.4-12

COPY standalone-openshift.xml /opt/eap/standalone/configuration

USER root
USER jboss

CMD ["/opt/eap/bin/openshift-launch.sh"]
# We are basing our builder image on openshift base-centos7 image
FROM registry.redhat.io/rhel8/httpd-24

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Platform for serving static HTML files" \
      io.k8s.display-name="Lighttpd 1.4.35" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,html,lighttpd" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"



# Copy the S2I scripts to /usr/libexec/s2i which is the location set for scripts
# in openshift/base-centos7 as io.openshift.s2i.scripts-url label
COPY ./.s2i/bin/ /usr/libexec/s2i

EXPOSE 8080

# Set the default user for the image, the user itself was created in the base image
USER 1001

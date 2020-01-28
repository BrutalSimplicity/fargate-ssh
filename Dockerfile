# Use this image rather than normal ubuntu to allow inspection of the
# actual instance metadata passed to the container.
# See https://github.com/phusion/baseimage-docker/issues/54
FROM phusion/baseimage

RUN rm -f /etc/service/sshd/down

# DO NOT USE THIS FOR PRODUCITON SCENARIOS
# The included private key comes from a public repo, and
# should only be used for temporary development scenarios
RUN /usr/sbin/enable_insecure_key

EXPOSE 22
CMD ["/sbin/my_init"]
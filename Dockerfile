# We are basing our builder image on openshift base-centos7 image
FROM image-registry.openshift-image-registry.svc:5000/openshift/python

# Enable epel repository for lighttpd
RUN yum install -y epel-release

# Import the EPEL GPG-key
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

# Update the repositories
RUN yum -y update

# Install the required software, namely Lighttpd and
# clean yum cache files, as they are not needed and will only make the image bigger in the end
RUN yum install -y nginx && \
    yum clean all -y

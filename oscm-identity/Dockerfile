 #*****************************************************************************
 #*                                                                           *
 #* Copyright FUJITSU LIMITED 2020                                            *
 #*                                                                           *
 #* Creation Date: 16-07-2020                                                 *
 #*                                                                           *
 #*****************************************************************************

FROM oscm-centos-based

COPY ssl.crt /opt/ssl.crt
COPY ssl.key /opt/ssl.key
COPY ssl.crt /usr/share/pki/ca-trust-source/anchors

RUN mkdir /opt/identity && \
    mkdir /opt/identity/config && \
	   mkdir /opt/certs && \
	   mkdir /opt/identity/config/tenants && \
    export http_proxy=$HTTP_PROXY && \
    export https_proxy=$HTTP_PROXY && \
    yum install -y \
    	tar \
        which \
        java-1.8.0-openjdk \
        java-1.8.0-openjdk-devel && \
    yum clean all

COPY oscm-identity.jar /opt/identity/main.jar
COPY start.sh /opt/identity/start.sh
 
RUN chmod +x /opt/identity/start.sh

CMD ["/opt/identity/start.sh"]

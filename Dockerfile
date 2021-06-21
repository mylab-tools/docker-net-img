FROM mcr.microsoft.com/dotnet/aspnet:5.0

# Install Docker
RUN apt-get update && \
	apt-get -y install \
	     apt-transport-https \
	     ca-certificates \
	     curl \
	     gnupg2 \
	     software-properties-common && \
	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
	apt-key fingerprint 0EBFCD88 && \
	add-apt-repository \
   		"deb [arch=amd64] https://download.docker.com/linux/debian \
   		$(lsb_release -cs) \
   		stable" && \
	apt-get update && \
	apt-get -y install docker-ce
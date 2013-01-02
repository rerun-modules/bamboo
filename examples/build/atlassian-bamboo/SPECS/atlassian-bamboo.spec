Summary: Atlassian Bamboo Continuous Integration Server

# The package name, version and release are supplied by rpm:build using rpmbuild(8)'s "--define" option:
Name: %{name}
Version: %{version}
Release: %{release} 

# Assumes the appropriate community release has been downloaded to SOURCES from maven mirror
Source0: %{name}-%{version}.tgz
 
License: LGPL
Group: Applications/System

BuildArch: noarch

# Specify minimum Java version required:
Requires: java

# Disables debug packages and stripping of binaries:
%global _enable_debug_package 0
%global debug_package %{nil}
%global __os_install_post %{nil}
 
# stop the build failing just becauses there are a few sample binaries in the distribution:
%define _binaries_in_noarch_packages_terminate_build   0


%description
Atlassian Bamboo Continuous Integration Server
 
%prep

%setup
# Overlay the source package contents with the customized files and directories:
#cp -R $RPM_SOURCE_DIR/etc/* $RPM_BUILD_DIR/%{name}-%{version}

#/usr/share/atlassian-bamboo/atlassian-bamboo-4.3.3/



%build
 
%install
# setup the target directory hierarchy:
rm -rf %{buildroot}
install -d -m 755 %{buildroot}/usr/share/atlassian-bamboo/atlassian-bamboo-%{version}
mv * %{buildroot}/usr/share/atlassian-bamboo/atlassian-bamboo-%{version}


if [ ! -f %{buildroot}/usr/share/atlassian-bamboo/atlassian-bamboo-%{version}/webapp/WEB-INF/classes/bamboo-init.properties ]
then
   echo "ERROR: %{buildroot}/usr/share/atlassian-bamboo/atlassian-bamboo-%{version}/webapp/WEB-INF/classes/bamboo-init.properties  does not exist" 1>&2
   exit 1
fi

install -d -m 755 %{buildroot}/usr/share/atlassian-bamboo/bamboo-home
cp $RPM_SOURCE_DIR/usr/share/atlassian-bamboo/bamboo-home/bamboo.cfg.xml %{buildroot}/usr/share/atlassian-bamboo/bamboo-home/bamboo.cfg.xml 

# Experimental: import a pre built configuration from a reference install
# (cd %{buildroot} && tar zxf $RPM_SOURCE_DIR/bamboo-home-%{version}.tgz)


#this should be a config file
cat >> %{buildroot}/usr/share/atlassian-bamboo/atlassian-bamboo-%{version}/webapp/WEB-INF/classes/bamboo-init.properties <<EOF
bamboo.home=/usr/share/atlassian-bamboo/bamboo-home
EOF


install -d -m 755 %{buildroot}/etc/rc.d/init.d
sed \
   -e 's,@NAME@,bamboo,' \
   -e 's,@BAMBOO_HOME@,/usr/share/atlassian-bamboo/bamboo-home,' \
   -e 's,@BAMBOO_INSTALL@,/usr/share/atlassian-bamboo/atlassian-bamboo-%{version},' \
   -e 's,@BAMBOO_USER@,bamboo,' \
   $RPM_SOURCE_DIR/etc/rc.d/init.d/bamboo.template > %{buildroot}/etc/rc.d/init.d/bamboo



#
# EXPERIMENTAL TO SEE ABOUT AUTOMATING LICENSE CONFIGURATION, NOT SOLVED YET
#
#install -d -m 755 %{buildroot}/usr/share/atlassian-bamboo/bamboo-home
#cp $RPM_SOURCE_DIR/usr/share/atlassian-bamboo/bamboo-home/bamboo.cfg.xml %{buildroot}/usr/share/atlassian-bamboo/bamboo-home/bamboo.cfg.xml 

#this should be a config file
#%{buildroot}/usr/share/atlassian-bamboo/atlassian-bamboo-4.3.3/conf/wrapper.conf 

#this should be a config file
#/usr/share/atlassian-bamboo/bamboo-home/bamboo.cfg.xml 


%clean

%files
# add the files to the RPM with appropriate permissions: 
%defattr(-,bamboo,bamboo)

/usr/share/atlassian-bamboo
%config /usr/share/atlassian-bamboo/bamboo-home/bamboo.cfg.xml 

%attr(755,root,root) /etc/rc.d/init.d/bamboo
 
%changelog

%pre
# make sure the nexus user and group exist:
if id bamboo > /dev/null 2>&1
then
  :
else
  groupadd -f bamboo
  useradd -rd /usr/share/atlassian-bamboo -gbamboo bamboo
  passwd -l bamboo
fi


%post
# setup nexus as a system service:
chkconfig --add bamboo
chkconfig --level 345 bamboo on

%preun
service bamboo stop

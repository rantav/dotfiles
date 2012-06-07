export EDITOR=vi

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# brew doctor reccomendations:
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
# allow colors for ls
#export CLICOLOR=1

export M2_REPO=~/.m2/

# MacPorts Installer addition on 2009-06-01_at_23:38:15: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-06-01_at_23:38:15: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.


# newer subversion version is at /opt/subversion/bin
export PATH=/opt/subversion/bin:$PATH

# add ~/bin to the path
export PATH=~/bin:$PATH:~/dev/obgit/trunk/devtools/bin:~/dev/obgit/trunk/devtools/bin/osx

# Java version and home
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home/"

# settings for ant
export ANT_OPTS="-Xms384m -Xmx384m"
export ANT_HOME=/usr/local/apache-ant-1.8.1/

export CLASSPATH=/Library/tomcat/server/lib/:/Library/tomcat/common/lib/

# Setup tomcat debug mode for jpda
export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket

export JAVA_OPTS='-Xmx1024m -Xms256m -XX:MaxPermSize=256m'
export CATALINA_OPTS='-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.outbrain.environment=dev -Dlog4j.configuration=file:///Library/tomcat/common/classes/log4j.xml -Djava.awt.headless=true'
export MAVEN_OPTS='-Xmx2024m -Xms256m'

# environment for unit tests
export com_outbrain_environment=junit

alias mvn-eclipse='mvn eclipse:eclipse -Dwtpversion=2.0 -DdownloadSources=true  -DdownloadJavadocs=true'
alias mvn-install='mvn install -DskipTests=true -DwarProject.packaging=jar'

function mvn-make {
  mvn -am -pl $1 install -DskipTests -DwarProject.packaging=jar
}

function mvn-make-dependents {
  mvn -amd -pl $1 install -DskipTests -DwarProject.packaging=jar
}

function mvn-make-all-related {
  mvn -am -amd -pl $1 install -DskipTests -DwarProject.packaging=jar
}

# rjar
export RJAR_HOME=/Users/ran/bin/rjar
export PATH=$PATH:$RJAR_HOME/bin

alias flushdns="dscacheutil -flushcache"

alias jscompile="java -jar /Users/ran/dev/obgit/trunk/devtools/bin/closure-js-compiler/compiler.jar"

export PATH=$PATH:/android/android-sdk-mac_x86:/android/android-sdk-mac_x86/platform-tools:/android/android-sdk-mac_x86/tools

# Scala
export PATH=$PATH:/scala/scala-2.8.1.final/bin/

# Grails
export GRAILS_HOME=/grails/grails-1.3.5
export PATH=$GRAILS_HOME/bin:$PATH

# Groovy
export GROOVY_HOME=/groovy/groovy-1.8.0
export PATH=$GROOVY_HOME/bin:$PATH

export PATH=$PATH:/appengine/appengine-java-sdk-1.5.2/bin

export GRADLE_HOME=/gradle/gradle-0.9.2
export PATH=$GRADLE_HOME/bin:$PATH

export MAVEN_HOME=/usr/share/apache-maven-3.0.1/
export PATH=$MAVEN_HOME/bin:$PATH

# JRuby
export JRUBY_HOME=/Users/ran/.rvm/src/jruby-1.6.5/
export PATH=$PATH:$JRUBY_HOME/bin/

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

alias g=gradle

# NodeJs
export PATH=$HOME/local/node/bin:$PATH

# Clojure
alias clj='/clojure/clj'

# EC2
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=~/.ec2/pk-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem
export EC2_CERT=~/.ec2/cert-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem

alias pretty-json='python -mjson.tool'

alias mongo-run='mongod run --config /usr/local/Cellar/mongodb/mongod.conf'


# Add ~/bin to the path
export PATH=$HOME/bin:$PATH

# Start an HTTP server from a directory, optionally specifying the port
# Example: 
# $ server
# Or:
# $ server 8002
function server() {
  local port="${1:-8000}"
  (sleep 0.5; open "http://localhost:${port}")&
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

export GLU_USER=xxx
export GLU_PASS=xxx
export GLU_HOST_PORT=xxx:8080
export GLU_FABRIC=xxx

alias mysqld='sudo /usr/local/mysql/bin/mysqld_safe'
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

#!/bin/bash
#echo "Checking java JDK version"
#command -v javac >/dev/null 2>&1 || { echo >&2 "Java JDK is not installed"; }

#variables
		purge_='sudo apt-get purge '
		update_='sudo apt update '
		install_='sudo apt install ' 

#checking for java files and exe
echo Java JRE -
if type -p java; then
    echo Found Java executable in PATH
    _java=java  
elif [[ -n $JAVA_HOME ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo Found Java executable in JAVA_HOME
    _java="$JAVA_HOME/bin/java"
else
    echo "no JRE found"
fi
	
if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo Version "$version"
fi

echo
echo Java JDK -
if type -p javac; then
    echo Found Javac executable in PATH
    _javac=javac  
elif [[ -n $JAVA_HOME ]] && [[ -x "$JAVA_HOME/bin/javac" ]];  then
    echo Found Javac executable in JAVA_HOME
    _javac="$JAVA_HOME/bin/javac"
else
    echo "no JDK found"
    echo "Previous Java JDK files will also be removed in installation."
    read -r -p "Do you want to install it now? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
	        echo "Installing Java JDK "
		$purge_ 'java openjdk-*'
		$update_
		$install_ java -y
	else
	       echo "Installation aborted !"
	       exit
    fi
fi
	
if [[ "$_javac" ]]; then
	version=$("$_javac" -version 2>&1   | awk '{print $2}')
    echo Version "$version"
fi
#javac -version 2>&1 | head -n 1
#end of java

echo

#checking for python files and exe
echo Python -
if type -p python; then
    echo Found Python executable in PATH
    _python=python  
elif [[ -n $PYTHONPATH ]] && [[ -x "$PYTHONPATH/bin/javac" ]];  then
    echo Found Python executable in PYTHONPATH
    _javac="$PYTHONPATH/bin/javac"
else
    echo "Python not found"
    echo "Previous Python files will also be removed in installation."
    read -r -p "Do you want to install it now? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
	        echo "Installing Python "
		$purge_ 'python'
		$update_
		$install_ python -y
	else
	       echo "Installation aborted !"
	       exit
    fi
fi
	
if [[ "$_python" ]]; then
    	version=$("$_python" --version 2>&1  | awk '{print $2}')
    echo Version "$version"
fi
#python -V
#end of python

echo
#checking for php files and exe
echo PHP -
if type -p php; then
    echo Found PHP executable in PATH
    _php=php  
else
    echo "PHP not found"
    echo "Previous PHP files will also be removed in installation."
    read -r -p "Do you want to install it now? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
	        echo "Installing PHP "
		$purge_ 'php*'
		$update_
		$install_ php -y
	else
	       echo "Installation aborted !"
	       exit
    fi
fi
	
if [[ "$_php" ]]; then
    	version=$("$_php" -v 2>&1  | head -n 1 | awk '{print $2}')
    echo Version "$version"
fi
#php -version 2>&1 | head -n 1
#end of php
echo


#checking for nodejs files and exe
echo NodeJS -
if type -p nodejs; then
    echo Found NodeJS executable in PATH
    _nodejs=nodejs  
else
    echo "NodeJS not found"
    echo "Previous NodeJS files will also be removed in installation."
    read -r -p "Do you want to install it now? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
	        echo "Installing NodeJS "
		$purge_ 'nodejs'
		$update_
		$install_ nodejs -y
	else
	       echo "Installation aborted !"
	       exit
    fi
fi
	
if [[ "$_nodejs" ]]; then
    	version=$("$_nodejs" -v )
    echo Version "$version"
fi

echo
#checking for android files and exe
echo Android -

#end of android 
echo
echo exit 0

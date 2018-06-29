# fictionArt
A command line tool written in ruby that displays ascii art of famous animated fictional characters.   

## Requirements  
```
=> Homebrew (for macOS)
=> ruby version >= 1.8.6 (pre-installed on macOS, can be easily installed on linux)  
=> ImageMagick library (will be installed in next section)  
```

## Installation  

### Linux  
**Paste the following lines in your .bashrc file**  
```
  export GEM_HOME=$HOME/.gem
  export GEM_PATH=$HOME/.gem
```  

**Run the following commands after (without the '$' sign) ruby has been installed succesfully**  
```
$ sudo apt-get install imagemagick libmagickwand-dev
$ gem install fictionArt
```  

### MacOS
**Paste the following lines in your .bash_profile**  
```
  export GEM_HOME=$HOME/.gem
  export GEM_PATH=$HOME/.gem
```  

**Run the following commands (without the '$' sign) after ruby has been installed succesfully**  
```
$ brew install imagemagick@6 && brew link imagemagick@6 --force
$ gem install fictionArt
```  

### Usage 
**Example**  
```
$ fictionArt ironman
```
**Output**  
![image](https://github.com/vaithak/fictionArt/blob/master/example_image.png)  

### Help
```
$ fictionArt -h
```  

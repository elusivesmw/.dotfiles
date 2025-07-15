#!/bin/bash

# Basic color functions
red() { echo -e "\033[31m$*\033[0m"; }
green() { echo -e "\033[32m$*\033[0m"; }
yellow() { echo -e "\033[33m$*\033[0m"; }
blue() { echo -e "\033[34m$*\033[0m"; }
magenta() { echo -e "\033[35m$*\033[0m"; }
cyan() { echo -e "\033[36m$*\033[0m"; }
white() { echo -e "\033[37m$*\033[0m"; }
black() { echo -e "\033[30m$*\033[0m"; }

# Bold/bright versions
bold_red() { echo -e "\033[1;31m$*\033[0m"; }
bold_green() { echo -e "\033[1;32m$*\033[0m"; }
bold_yellow() { echo -e "\033[1;33m$*\033[0m"; }
bold_blue() { echo -e "\033[1;34m$*\033[0m"; }
bold_magenta() { echo -e "\033[1;35m$*\033[0m"; }
bold_cyan() { echo -e "\033[1;36m$*\033[0m"; }
bold_white() { echo -e "\033[1;37m$*\033[0m"; }

# Common status functions
success() { green "✓ $*"; }
error() { red "✗ $*"; }
warning() { yellow "⚠ $*"; }
info() { blue "ⓘ $*"; }

# Progress indicator
progress() {
    local current=$1
    local total=$2
    local message=$3
    local percent=$((current * 100 / total))
    printf "\r$(cyan "Progress:") [$(green "%3d%%")] %s" "$percent" "$message"
}

# Example usage function
color_demo() {
    echo "=== Basic Colors ==="
    red "This is red text"
    green "This is green text"
    yellow "This is yellow text"
    blue "This is blue text"
    magenta "This is magenta text"
    cyan "This is cyan text"
    
    echo -e "\n=== Bold Colors ==="
    bold_red "Bold red text"
    bold_green "Bold green text"
    bold_blue "Bold blue text"
    
    echo -e "\n=== Status Messages ==="
    success "Operation completed successfully"
    error "Something went wrong"
    warning "This is a warning"
    info "Just some information"

    echo -e "\n=== Progress ==="
    progress 3 33 "Making progress"
}


#!/bin/bash

function printHeading() {
    printf "\n\n### $1 ###\n" | tr [a-z] [A-Z]
}

function printInstallHeading() {
    printf "\n\n### install $1 ###\n" | tr [a-z] [A-Z]
}
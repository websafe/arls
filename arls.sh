#!/bin/bash

# Advanced recursive ls

if [ -z "${1}" ];
then
    echo "Usage: ${0} <path> [[<order-by> [<order-direction>]]]";
    exit 1;
else
    path="${1}";
fi;

if [ -z "${2}" ];
then
    order_by="name";
else
    order_by="${2}";
fi;

if [ -z "${3}" ];
then
    order_dir="asc";
else
    order_dir="${3}";
fi;

#
case "${order_by}" in
    "access-rights" | "rights")
    	sort_column="%a";
    	sort_param_method="-n"
    ;;
    "group" | "g")
    	sort_column="%G";
    	sort_param_method=""
    ;;
    "mtime" | "m")
    	sort_column="%y";
    	sort_param_method=""
    ;;
    "name" | "n")
	sort_column="%n";
	sort_param_method=""
    ;;
    "owner" | "o" | "user" | "u")
    	sort_column="%U";
    	sort_param_method=""
    ;;
    "size" | "s" | "bytes" | "b")
    	sort_column="%s";
    	sort_param_method="-n"
    ;;
    "type" | "t")
    	sort_column="%F";
    	sort_param_method=""
    ;;
    *)
	echo "Unknown order by: ${order_by}";
	exit 2;
    ;;
esac

#
case "${order_dir}" in
    "asc" | "a")
    	sort_param_order="";
    ;;
    "desc" | "d")
    	sort_param_order="-r";
    ;;
    *)
	echo "Unknown order direction: ${order_dir}";
	exit 2;
    ;;
esac

#
if [ -d "${path}" ];
then
    (
	cd ${path};
	#
	LANG="en_US.UTF-8" find ./ \
	    -exec stat --printf "${sort_column}\t%F\t%y\t%a\t%U:%G\t%s\t%N\n" '{}' \; \
    	    | sort ${sort_param_method} ${sort_param_order} \
    	    | cut -f2-;
    );
else
    echo "MSG_DIR_NOT_FOUND: ${path}";
fi;

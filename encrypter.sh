#!/bin/bash

function encrypt() {
encrypted_message=""
read -p "Would you like to encrypt a message (y/yes/n/no): " enc

                if [[ $enc == 'y' ||  $enc == 'yes' ]]; then

                        read -p "Enter message to encrypt: " mess
			for (( i=0; i<${#mess}; i++ )); do
				found="false"
				char="${mess:$i:1}"
				for j in "${!key[@]}"; do
					if [[ "${key[$j]}" == "$char" ]]; then
						encrypted_message+="${sub_key[$j]}"
						found="true"
						break
					fi
				done
				if [[ $found == "false" ]]; then
    					encrypted_message+="$char"
				fi
			done
			echo "Encrypted string: $encrypted_message"
			echo " "

                elif [[ $enc == 'n' || $enc == 'no' ]]; then

                        echo "Thank you for using The Encrypter"
			echo " "
                        exit 0

                else
                        echo "Invalid input try again"
			echo " "
                fi

}

function decrypt() {
decrypted_message=""
read -p "Would you like to decrypt a message (y/yes/n/no): " denc

                if [[ $denc == 'y' ||  $denc == 'yes' ]]; then

                        read -p "Enter message to decrypt: " mesenc
                        for (( i=0; i<${#mesenc}; i++ )); do
				foun="false"
                                chars="${mesenc:$i:1}"
                                for j in "${!sub_key[@]}"; do
                                        if [[ "${sub_key[$j]}" == "$chars" ]]; then
                                                decrypted_message+="${key[$j]}"
						foun="true"
                                                break
                                        fi
				done
				if [[ $foun == "false" ]]; then
        	                        decrypted_message+="$chars"
                                fi
                        done
                        echo "Decrypted string: $decrypted_message"
                        echo " "

                elif [[ $denc == 'n' || $denc == 'no' ]]; then

                        echo "Thank you for using The Encrypter"
			echo " "
                        exit 0

                else
                        echo "Invalid input try again"
			echo " "

                fi
}
key=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' '0' '1' '2' '3' '4' '5' '6' '7' '8' '9')
sub_key=('0' 'Z' 'y' 'X' 'w' 'V' '9' 'u' 'T' 's' 'R' 'q' '8' 'P' 'o' 'N' 'm' 'L' '7' 'k' 'J' 'i' 'H' 'g' '6' 'F' 'e' 'D' 'c' 'B' '5' 'a' 'z' 'Y' 'x' 'W' '4' 'v' 'U' 't' 'S' 'r' '3' 'Q' 'p' 'O' 'n' 'M' '2' 'l' 'K' 'j' 'I' 'h' '1' 'G' 'f' 'E' 'd' 'C' 'b' 'A')

while [[ 1 -ge 0 ]]; do

	echo -e "Would you like to: \n1)Encrypt\n2)Decrypt"
	read -p "Enter 1 or 2 (3 to exit): " val

	if [[ $val -eq 1 ]]; then
		encrypt

	elif [[ $val -eq 2 ]]; then
		decrypt
	elif [[ $val -eq 3 ]]; then
    		echo "Exiting... Goodbye!"
    		exit 0
	else
    		echo "Invalid input, try again"
   		echo " "
	fi
done
    

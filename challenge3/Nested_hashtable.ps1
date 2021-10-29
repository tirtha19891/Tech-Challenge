#declaring object1 hashtable for storing key-value pairs
$data1 = @{
                'a' = @{
                           'b' =  @{
                                        'c' = 'd'

                                    }
                        }
            }
#declaring object2 hashtable for storing key-value pairs
$data2 = @{
                'x' = @{
                           'y' =  @{
                                        'z' = 'a'

                                    }
                        }
            }

#nested loop function which takes the objects and loops through each key until the last key and prints the value of the last key
function keys ($data) { 
    foreach ($k in $data.keys) { 
        $data = $data[$k]
        if($data.GetType().Name -eq 'String'){
            #Diplay output of the last key value
            write-host "Last Value of the Key is: $($data) "
        }
        keys ($data) 
    }
}
#Calling functions
keys($data1)
keys($data2)
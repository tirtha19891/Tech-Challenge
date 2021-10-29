# Problem statement

  

We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.

  

> Given an object

```json

{"a":{"b":{"c":"d"}}}

```

> and the key =

`` a/b/c ``

the function to return

```json

d

```

  

## Script used : PowerShell

>Powershell stores key-value pairs in a object called hash table. As this is a nested hashtable, a loop has been written to traverse through each keys until the last key in the object

  

# Approach

Define a function that takes a parameter object

> I've not mentioned mentioned any key for passing as parameter in the function, as I can see only the last key has the value which should be returned. If we return any other key value, then it will also be a hash object which would not return any key value.

> I have written a function which first has a for-each loop which takes the key, gets the value, and then assigned than value object in the same function and call it again. This is a nested loop which goes until we get to the last key, and then I print the value of the key.

 
# Output

We have 2 nested objects
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

> after running the script it will produce output like below
Last Value of the Key is: d 
Last Value of the Key is: a             
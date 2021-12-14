*** Setting ***

Library  os
#for specify the location of the file
Library  Collections

*** Test Case ***
TestCase:
    ${json_obj}=  get file   C:\Users\IMHUSSAI\JSON_file\jsondata1.json
    ${object}=  Evaluate  json.loads('''${json}''')  json

    #${name_value}=  get value from json  ${json_obj}  $.firstName
    log to console  ${name_value[0]} 
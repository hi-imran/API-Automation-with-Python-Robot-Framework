*** Setting ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  http://thetestingworldapi.com/

*** Test Case ***
Update_Resource
    create session  MySession  ${base_url}
    ${body}=  create dictionary  first_name=Imran  middle_name=8961824809  last_name=Engineer  date_of_birth=22/08/1996
    ${header}=  create dictionary  Content-Type=application/json

    ${response}=  put request  MySession  api/studentsDetails/1818  data=${body}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
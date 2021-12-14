*** Setting ***
Library  RequestsLibrary
Library  Collections

*** Variable ***
${Base_Url}  http://thetestingworldapi.com/

*** Test Case ***
Create_New_Resource
    create session  AddData  ${Base_Url}
    ${body}=  create dictionary  first_name=Imran  middle_name=Hussain  last_name=Engineer  date_of_birth=22/08/1996
    ${header}=  create dictionary  Content-Type=application/json

    ${response}=  post request  AddData  api/Students  data=${body}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}






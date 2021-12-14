*** Setting ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  http://thetestingworldapi.com/

*** Test Case ***
Validate_Delete_Request
    create session  MySession  ${base_url}
    ${response}=  delete request   MySession  api/studentsDetails/11123
    #log to console  ${response.status_code}
    #log to console  ${response.content}

    #VALIDATION
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

    #${content_in_json}=  to json  ${response.content}
    #${content_list}=  get  ${content_in_json}  status
    #${status}=  get from list   ${content_list}
    #should be equal   ${status}  true
*** Setting ***
Library  RequestsLibrary
Library  Collections
*** Variable ***
${Base_Url}  http://thetestingworldapi.com/


*** Test Case ***
Students_Details
    create session  Get_Student_Details  ${Base_Url}
    ${response}=  get on session  Get_Student_Details  api/studentsDetails
    #log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}

    #VALIDATION
    ${Status_Code}=  convert to string  ${response.status_code}
    should be equal  ${Status_Code}  200
    #200 is in string format

    ${body}=  convert to string  ${response.content}
    should contain  ${body}  Testing FN

    ${Get_X-Powered-By_Value}=  get from dictionary  ${response.headers}  Pragma
    #log to console  ${Get_X-Powered-By_Value}
    should be equal  ${Get_X-Powered-By_Value}  no-cache

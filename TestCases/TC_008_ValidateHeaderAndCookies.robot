*** Setting ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders:
    create session  mysession   ${base_url}
    ${response}=  get on session  mysession  /photos

    #log to console  ${response.headers}

    ${ContentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${ContentTypeValue}  application/json; charset=utf-8

    ${etagValue}=  get from dictionary  ${response.headers}  etag
    should be equal  ${etagValue}  W/"105970-HCYFejK2YCxztz8++2rHnutkPOQ"
TestCookies:
    create session  mysession   ${base_url}
    ${response}=  get on session  mysession  /photos
    log to console  ${response.cookies}

    #${cookie_value}=  get from dictionary  ${response.cookies}  #cookiesName
    #log to console  ${cookie_value}

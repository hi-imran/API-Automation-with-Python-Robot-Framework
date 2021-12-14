*** Setting ***
Library  XML
Library  OperatingSystem
Library  Collections
Library  RequestsLibrary

*** Variable ***
${base_url}  http://thomas-bayer.com

*** Test Case ***
TestCase1:
    create session  mysession  ${base_url}
    ${response}=  get on session  mysession  /sqlrest/CUSTOMER/15
    ${xml_string}=  convert to string   ${response.content}
    ${xml_obj}=  parse xml    ${xml_string}

    #Validate single element
    element text should be   ${xml_obj}  15  .//ID

    #Validate multiple element
    ${childe_elements}=  get child elements    ${xml_obj}
    should not be empty  ${childe_elements}

    ${id}=  get element text  ${childe_elements[0]}
    ${fname}=  get element text  ${childe_elements[1]}
    ${lname}=  get element text  ${childe_elements[2]}
    ${street}=  get element text  ${childe_elements[3]}
    ${city}=  get element text  ${childe_elements[4]}

    should be equal  ${id}  15
    should be equal  ${fname}  Bill
    should be equal  ${lname}  Clancy
    should be equal  ${street}  319 Upland Pl.
    should be equal  ${city}  Seattle


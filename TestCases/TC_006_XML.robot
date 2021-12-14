*** Setting ***
Library  XML
Library  OperatingSystem
Library  Collections

*** Test Case ***
TestCase1:
    ${xml_object}=  parse xml  C:/Users/IMHUSSAI/Robotframework_Learning/employee.xml
    #${emp_name}=  get element text  ${xml_object}  .//row[1]/name
    #log to console  ${emp_name}

    #Validation
    #Validation_1=>check the single element value
    #approach_1
    ${emp_name}=  get element text  ${xml_object}  .//row[1]/name
    should be equal  ${emp_name}  manoj
    #approach_2
    ${emp_name}=  get element  ${xml_object}  .//row[1]/name
    should be equal  ${emp_name.text}  manoj
    #approach_3
    element text should be  ${xml_object}  manoj  .//row[1]/name
TastCase2:
    #Validate number of elements present in the xml file
    ${xml_object}=  parse xml  C:/Users/IMHUSSAI/Robotframework_Learning/employee.xml
    ${no_of_rows}=  get element count  ${xml_object}  .//row
    #log to console  ${no_of_rows}
    should be equal as integers  ${no_of_rows}  55
TastCase3:
    #Validate attribute present in the xml file
    ${xml_object}=  parse xml  C:/Users/IMHUSSAI/Robotframework_Learning/employee.xml
    element attribute should be  ${xml_object}  id  imran  .//row[1]
TastCase4:
    #Validate child element present in XML File
    ${xml_object}=  parse xml  C:/Users/IMHUSSAI/Robotframework_Learning/employee.xml
    ${child_elements}=  get child elements  ${xml_object}  .//row[1]
    should not be empty  ${child_elements}

    ${fname}=  get element text   ${child_elements[0]}
    ${email}=  get element text   ${child_elements[1]}
    ${password}=  get element text   ${child_elements[2]}

    #log to console  ${fname}
    #log to console  ${email}
    #log to console  ${password}

    should be equal  ${fname}  manoj
    should be equal  ${email}  manoj@gmail.com
    should be equal  ${password}  Test@123

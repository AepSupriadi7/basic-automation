*** Settings ***
Library           SeleniumLibrary

*** variables ***
${BROWSER}     chrome
${HOST}    https://weighted-product.jogjalab.com/login

${EMAIL}    admin
${PASS-1}    admin    # correct password
${PASS-2}    minad    # wrong password

${COMPANY}    global.inc
${TITLE}    [TEST] Senior Engineering manager
${LOCATION}     Singapore
${TAGS}    engineering manager software
${JOBEMAIL}    jobs@global.co
${WEBSITE}    https://global.co
${DESCRIPTION}     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

*** Test Cases ***

# login
# positive test
Login Success
    Open Browser    ${HOST}    ${BROWSER}
    Page Should Contain Element     xpath://button[@name='cancel']
    input text        name:username       ${EMAIL}
    input text        name:password    ${PASS-1}
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element   xpath://img[@src='https://weighted-product.jogjalab.com/images/logo.png']
    Close Browser

Login Gagal
    Open Browser    ${HOST}    ${BROWSER}
    Page Should Contain Element     xpath://button[@name='cancel']
    input text        name:username       ${EMAIL}
    input text        name:password    ${PASS-2}
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element   xpath://button[@name='cancel']
    Close Browser

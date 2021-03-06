<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>fdg</fullName>
        <apiVersion>33.0</apiVersion>
        <endpointUrl>http://www.gmail.com</endpointUrl>
        <fields>Account_ExternalID__c</fields>
        <fields>Annual_Income__c</fields>
        <fields>BillingLongitude</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>abdul.khan@in.ey.com</integrationUser>
        <name>fdg</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>testoutbound</fullName>
        <apiVersion>33.0</apiVersion>
        <endpointUrl>http://www.google.com</endpointUrl>
        <fields>AccountNumber</fields>
        <fields>Account_ExternalID__c</fields>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>abdul.khan@in.ey.com</integrationUser>
        <name>testoutbound</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Test</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>testoutbound</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>

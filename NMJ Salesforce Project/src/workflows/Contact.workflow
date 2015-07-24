<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Aniversary_Email</fullName>
        <description>Aniversary Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Contact_Send_Anniversary_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Birthday_Email</fullName>
        <description>Birthday Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Contact_Birthday_Tomorrow_Birthday_Wishes</template>
    </alerts>
    <alerts>
        <fullName>Birthday_Reminder_Email</fullName>
        <description>Birthday Reminder Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Contact_Birthday_Tomorrow_Birthday_Wishes</template>
    </alerts>
    <alerts>
        <fullName>test</fullName>
        <description>test</description>
        <protected>false</protected>
        <recipients>
            <recipient>tempuser1@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Contact_Birthday_Tomorrow_Birthday_Wishes</template>
    </alerts>
    <fieldUpdates>
        <fullName>Check_Reset_Anniversary_Email_System_Box</fullName>
        <field>Reset_Aniversary_Email__c</field>
        <literalValue>1</literalValue>
        <name>Check Reset Anniversary Email System Box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Reset_Birthday_Email_System_Box</fullName>
        <field>Reset_Birthday_Email_System__c</field>
        <literalValue>1</literalValue>
        <name>Check Reset Birthday Email System Box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Anniversary_System</fullName>
        <field>Reset_Aniversary_Email__c</field>
        <literalValue>0</literalValue>
        <name>Reset Anniversary System</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Birthday_System</fullName>
        <field>Reset_Birthday_Email_System__c</field>
        <literalValue>0</literalValue>
        <name>Reset Birthday System</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>resetanniversarybirthday</fullName>
        <field>Next_Anniversary_Date1__c</field>
        <formula>IF ( MONTH (Anniversary__c)=2 &amp;&amp; DAY (Anniversary__c)=29,
IF ((DATE (YEAR(TODAY()),1,1) + 59) &gt; TODAY(),
(DATE (YEAR(TODAY()),1,1)) + 59,
(DATE (YEAR(TODAY())+1,1,1)) + 59),
IF (DATE (YEAR(TODAY()),MONTH(Anniversary__c),DAY(Anniversary__c)) &gt; TODAY(),
DATE (YEAR(TODAY()),MONTH(Anniversary__c),DAY(Anniversary__c)),
DATE (YEAR(TODAY())+1,MONTH(Anniversary__c),DAY(Anniversary__c))
)
)</formula>
        <name>Reset Anniversary Birthday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>resetnextbirthday</fullName>
        <field>Reset_Next_Birthday__c</field>
        <formula>IF ( MONTH ( Birthday_New__c )=2 &amp;&amp; DAY (Birthday_New__c)=29, 
IF ((DATE (YEAR(TODAY()),1,1) + 59) &gt; TODAY(), 
(DATE (YEAR(TODAY()),1,1)) + 59, 
(DATE (YEAR(TODAY())+1,1,1)) + 59), 
IF (DATE (YEAR(TODAY()),MONTH(Birthday_New__c),DAY(Birthday_New__c)) &gt; TODAY(), 
DATE (YEAR(TODAY()),MONTH(Birthday_New__c),DAY(Birthday_New__c)), 
DATE (YEAR(TODAY())+1,MONTH(Birthday_New__c),DAY(Birthday_New__c)) 
) 
)</formula>
        <name>Reset Next Birthday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Reset Anniversary Email</fullName>
        <actions>
            <name>resetanniversarybirthday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Reset_Aniversary_Email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Reset_Anniversary_System</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Contact.Next_Anniversary_Date1__c</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Reset Birthday Email</fullName>
        <actions>
            <name>resetnextbirthday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Reset_Birthday_Email_System__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Reset_Birthday_System</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Contact.Reset_Next_Birthday__c</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send_Anniversary_Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Reset_Aniversary_Email__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Anniversary__c</field>
            <operation>notEqual</operation>
            <value>1/1/1900</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Aniversary_Email</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Contact.Next_Anniversary_Date1__c</offsetFromField>
            <timeLength>-7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Check_Reset_Anniversary_Email_System_Box</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Contact.Next_Anniversary_Date1__c</offsetFromField>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send_Birthday_Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Reset_Birthday_Email_System__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Birthday_New__c</field>
            <operation>notEqual</operation>
            <value>1/1/1900</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Birthday_Email</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Contact.Reset_Next_Birthday__c</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Check_Reset_Birthday_Email_System_Box</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Contact.Reset_Next_Birthday__c</offsetFromField>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>test</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.AccountName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Birthday_Notification</fullName>
        <assignedTo>sharad.sonavane@niravmodi.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>-7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Contact.Birthdate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Birthday Notification</subject>
    </tasks>
</Workflow>

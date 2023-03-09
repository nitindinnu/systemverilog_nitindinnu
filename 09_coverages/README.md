[reference from](https://www.quora.com/What-s-the-difference-between-code-coverage-and-functional-coverage)


Coverage is a way to measure the quality of testing/verification and completeness.

**Code coverage** as the name implies measure the coverage across the code . This gives an indication of how well the code is tested by your stimulus. The information is normally collected by simulation tools and the user can analysis and improve their stimulus. Code coverage is normally classified as following types:

1.  Line/Statement coverage - Number of lines/statements executed
2.  Expression coverage - Various input combinations in a logical expression executed
3.  Branch/Condition coverage - Branches or conditions executed
4.  Toggle coverage - Signals/nets toggled
5.  FSM Coverage - State transitions in state machine logic.

**Functional Coverage** is a way in which a user writes certain instrumentation logic to monitor how well the stimulus is covering various functionality. Typically in SystemVerilog language, a user can use the coverage constructs to write cover points and bins and during simulation, the tools will monitor for coverage of these events.

Functional coverage is more important in a random testing (constrained random verification) to measure the quality of stimulus and completeness. Functionality and interesting design points are monitored using functional cover points and coverage tells how well those are covered.

That is a short answer and each can be big topic of its own

-----------------
There are two types of coverage metrics commonly used in Functional Verification to measure the completeness and efficiency of verification process.  
  
1) Code Coverage: Code coverage is a metric used to measure the degree to which the design code (HDL model) is tested by a given test suite. Code coverage is automatically extracted by the simulator when enabled.  
  
2) Functional Coverage: Functional coverage is a user-defined metric that measures how much of the design specification, as enumerated by features in the test plan, has been exercised. It can be used to measure whether interesting scenarios, corner cases, specification invariants, or other applicable design conditions — captured as features of the test plan — have been observed, validated, and tested. It is user-defined and not automatically inferred. It is also not dependent on the design code as it is implemented based on design specification
--------------------------------
Coverage is a generic term for measuring progress to complete design verification. The coverage tools gather the information and provides a report to the verification engineer in order to identify the coverage holes to modify existing tests or create new ones to fill the holes.

![](https://qph.cf2.quoracdn.net/main-qimg-0c5f349b64bbf213e34e7ba6c66016e3)

Code Coverage: Verifies the progress by measuring how many lines of code have been executed. The types of code coverage at different levels can be realized in the following ways:

1.  Line Coverage (measuring every line)
2.  Toggle Coverage (measuring if the bits have transitioned from 1->0 or 0->1)
3.  Branch Coverage (measuring the paths taken within if-else loops)
4.  Conditional Coverage (measuring the LHS of the ternary operators)
5.  FSM Coverage (measuring the transitioned states that have been covered)
6.  Block Coverage (measure the lines covered within a procedural block)

Functional Coverage: Functional Coverage is the measure of which design features have been exercised by the test. Once the designs become more and more complex, the only effective way to verify them is by using the CRT (Constrained based Random Testing)

Measuring Completeness of a Verification Design:

Initially both functional and code coverage are low. As we develop tests, run them over and over with different seeds. Here is the pictorial way of describing different scenarios for functional coverage and code coverage

![](https://qph.cf2.quoracdn.net/main-qimg-a5dcc6aa121ee070577e7bc459ee354b-pjlq)

Low Code Coverage + Low Functional Coverage:

-   Start of the project

Low Code Coverage + High Functional Coverage:

-   It is possible that the test plan is missing some features to cover (need more cover points/cases)
-   Dead code
-   Bugs in coverage monitors

High Code Coverage + Low Functional Coverage:

-   Poor Quality of stimulus (try different seeds)
-   Bugs in converge monitors

High Code Coverage + High Functional Coverage:

-   End-stage of the design, look for bug rates.

Hope this helps.

Please follow my space so I can answer more and more Interview questions to help the new college grads find job faster. Here, is the invite link: [VLSI Interview Community](https://vlsiqaforstudents.quora.com/ "vlsiqaforstudents.quora.com")

---------------------------------------
[reference from](http://vlsiverif.com/?page_id=246)
In this article we are not going in depth of coverages in sv but will get an broad idea of what all type of coverage are present and what is the difference between them.

Broadly there are 3 types of coverage

1.  **Code Coverage**
2.  **Functional Coverage**
3.  **Assertion Coverage**.

1. **Code Coverage:** it is generated by tool, its represents how extensively the test has exercised the code. It does not give the information of whether the test meet the functional intend or not. Following are the types of code coverage

**Statement coverage /line coverage:** its is the simplest type of coverage and should be 100% for every project. It represents whether all the lines of the code exercised or not. Suppose the design has 100 lines of code and your write a test such that in design it will never enter in one of the else block which is of 1 lines, so this 99 lines where never exercised and your statement coverage will become 99%. Comment module, endmodule, timescale are not covered in this.
1. **Block coverage:** It will reveal the deadcode in the design. it measures that if all the blocks has been exercised or not. Similar to above example now suppose the else part has multiple statements which are enclosed with begin..end block , so block coverage show that this block is never exercised. Let the dut has 5 blocks in total so your block overage will be 80%. always initial while if/esle fork/join all such are considered under block coverage  
2. **Conditional coverage**: it calculate if all the possible combinational values are evaluated or not inside a conditional statement ,logical operators are only considered . Suppose you have variable in1 and in2 and out such that out = in1 && in2; in that case you have total 4 possible combinational values of in1 and in2 and if in1=0;and in2=1; never occur then your conditional coverage will be 3/4 i.e 75%  
3. **Branch coverage:** Its is used to check if all the possible branches has been covered or not by the test. For an case statement it will point if all the possible cases has been exercised or not , or in if statement that both true and false along with else branches has been tested or not.  
4. **Toggle coverage :** It is measure of transition of bits of variable from one state to another state i.e 0->1 or 1->0. Toggle coverage could be as simple as the ratio of nodes toggled to the total number of nodes. suppose there is a variable [1:0]a on randomizing it it gets a value 2’b11 in this its toggle coverage will be 50% because both the bits has transition from 0->1. Its should be 100%  
5. **Path coverage :**Due to different conditional statements such as if-else or case conditions different executable path are created in design, Path coverage is used to check if all paths across different branches are covered or not, it is more complete than branch coverage. suppose you have if statement and in both if else path you have case statements which again execute if statements. so all possible path will be represented by this  
6. **Fsm coverage:** Dut can have multiple FSM and each FSM has N states. So FSM coverage gives the measure whether each state of FSM has been reached or not along with that transition from each state to remaining state has been done or not

2. **Functional Coverage:**  It is measure of how much design specification/feature has been exercised by test. It is as good as the model/Metrix created by the verification engineer, it is code you write to track whether important values, sets of values, or sequences of values that correspond to design or interface requirements, features, or boundary conditions have been exercised. A 100% functional coverage implements that all the features in the design has been implemented by the test. Suppose there are two variable of [2:0]var1 and [2:0]var2 i.e each can have 8 values , so functional coverage will reveal that if all possible values has been achieved by variables or not. Along with that if the spec state that var1 = 3’b111 followed by var2=3’b000 this type od scenarios will be modelled by covergroups and bins.
	1. ![](http://vlsiverif.com/wp-content/uploads/2021/06/image-5.png)

4.  **Assertion Coverage :** Suppose an assertion is written to check one of the functionality of DUT, you have stated the regression and you don’t get assertion error, does this means your assertion got passed? the answer is no, we are not sure wheter the assertion condition has been meet or not in the the first place. So to check whether the assertion has been exercised or not assertion coverage is used through **cover property**. The syntax of these is the same as that of assert property.
	1. ![](http://vlsiverif.com/wp-content/uploads/2021/06/image-6.png)
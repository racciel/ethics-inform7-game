"Researcher Dilemma" by "Andreas Leja"

[ROOMS START HERE]
The Setup is a room. "Welcome to the world of academic research. Before we begin, please tell us your name and your field of research."
The Welcome is a room. "A plain, white room with two folders on the table: one marked Dr. Stern, the other Dr. Vale. Your PhD begins now. You can examine their files or pick one of those supervisors."
Data Crisis is a room. "You have insufficient data for your paper. Your supervisor is pressuring you to submit it anyway. Do you fake the data or stay honest?"
Authorship is a room. "Your paper is published, but Dr. Stern has added his name as lead author without contributing anything. Do you confront him or stay silent?"
Plagiarism is a room. "You are struggling to meet a deadline. A colleague offers you their old paper to 'borrow' from. Do you copy or write own?"
Grant Misuse is a room. "You receive a research grant, but your lab is short on supplies. Do you use the grant for personal expenses or follow the rules?"

ChatGPT Dilemma is a room. "You are struggling to write a section of your paper. You consider using ChatGPT to generate text, but your university has unclear policies on AI-generated content. Do you use ChatGPT or write it yourself?"
Data Leak is a room. "You accidentally send a dataset containing sensitive participant information to a collaborator. Do you tell someone or try to fix quietly?"
The Participant Harm is a room. "Your experiment is producing interesting results, but a participant reports feeling distressed. Do you stop the experiment, protecting participant or do you continue the experiment?"

Hall of fame is a room. "Congratulations! You have successfully navigated the ethical dilemmas of your academic journey. Your name is now in the Hall of Fame for researchers!"

[ROOMS END HERE]


[SETUP STAGE STARTS HERE]
PlayerName is some text that varies. PlayerName is "".
ResearchField is some text that varies. ResearchField is "".
Decision Log is a list of text that varies. Decision Log is {}.

Setup stage is a number that varies. Setup stage is 0.

When play begins:
	now setup stage is 1;
	say "Please enter your name:";
	now the command prompt is "Name: ";

After reading a command:
	if setup stage is 0:
		continue the action;
	else if setup stage is 1:
		now PlayerName is the player's command;
		now setup stage is 2;
		say "Thank you, [PlayerName]. Now, what is your field of research?";
		now the command prompt is "Field: ";
		reject the player's command;
	else if setup stage is 2:
		now ResearchField is the player's command;
		now setup stage is 3;
		say "You entered: [PlayerName], researcher in [ResearchField]. Is this correct? (yes/no)";
		now the command prompt is "Confirm: ";
		reject the player's command;
	else if setup stage is 3:
		if the player's command matches "yes":
			say "Ahhhh, yes, I remember [PlayerName]! A rising star in [ResearchField], ready to begin their academic journey.";
			now the command prompt is "> ";
			now setup stage is 0;
			move the player to the Welcome;
			reject the player's command;
		else if the player's command matches "no":
			say "Let's try again. Please enter your name:";
			now PlayerName is "";
			now ResearchField is "";
			now setup stage is 1;
			now the command prompt is "Name: ";
			reject the player's command;
	else:
		say "Please answer yes or no.";
		reject the player's command;
[SETUP STAGE ENDS HERE]

[WHY STARTS HERE]
Asking why is an action applying to nothing.
Understand "why" as asking why.

Carry out asking why:
	if the location is the Welcome:
		say "You are just starting your PhD journey. No ethical dilemma yet—just choices!";
	else if the location is Data Crisis:
		say "You lack enough data for publication, but your supervisor is pressuring you to publish. The dilemma: Do you fake data to meet expectations, or stay honest and risk your career stalling?";
	else if the location is Authorship:
		say "Your supervisor has claimed lead authorship on your work without contributing. The dilemma: Do you confront them and risk retaliation, or stay silent and accept the injustice?";
	else if the location is Plagiarism:
		say "You are tempted to plagiarize to meet a deadline. The dilemma: Do you copy, or do your own work?";
	else if the location is Grant Misuse:
		say "You are tempted to misuse grant funds. The dilemma: Do you use the money for personal expenses, or only for research?";
	else if the location is ChatGPT Dilemma:
		say "You are considering using ChatGPT to generate text for your paper. The dilemma: Do you use AI assistance, or write it yourself?";
	else if the location is Data Leak:
		say "You accidentally sent sensitive data to a collaborator. The dilemma: Do you report the breach, or try to fix it quietly?";
	else if the location is The Participant Harm:
		say "Your experiment is distressing a participant. The dilemma: Do you stop the experiment to protect them, or continue for the sake of your data?";
	else:
		say "There is no special ethical dilemma here.";
[WHY ENDS HERE]


[WELCOME ROOM STARTS HERE]
Dr Stern's folder is in the Welcome. The description is "A leading expert in [ResearchField], known for pushing students hard, sometimes too hard."
Dr Vale's folder is in the Welcome. The description is "A full time professor at the department of [ResearchField]. Friendly, but not well-connected with other researchers."

Choosing a supervisor is a truth state that varies. Choosing a supervisor is false.
Picked Stern is a truth state that varies. Picked Stern is false.
Picked Vale is a truth state that varies. Picked Vale is false.

Understand "pick stern" or "choose stern" as picking Stern.
Understand "pick vale" or "choose vale" as picking Vale.

Picking Stern is an action applying to nothing.
Picking Vale is an action applying to nothing.

Carry out picking Stern:
	if choosing a supervisor is false:
		now choosing a supervisor is true;
		now Picked Stern is true;
		say "[PlayerName], you've chosen Dr. Stern as your supervisor. Let the work begin.";
		move the player to Data Crisis;
	else:
		say "You've already picked your supervisor.";

Carry out picking Vale:
	if choosing a supervisor is false:
		now choosing a supervisor is true;
		now Picked Vale is true;
		say "[PlayerName], you've chosen Dr. Vale as your supervisor. Let the work begin.";
		move the player to Data Crisis;
	else:
		say "You've already picked your supervisor.";
[WELCOME ROOM ENDS HERE]

[I. DATA CRISIS STARTS HERE]
Faking is a truth state that varies. Faking is false.

Understand "fake data" as faking data.
Understand "submit anyway" or "fabricate data" as faking data.

Faking data is an action applying to nothing.

Carry out faking data:
	now faking is true;
	say "You fabricate the missing results and submit the paper.";
	let n be a random number from 1 to 100;
	if n <= 25:
		say "Unfortunately, a reviewer spots inconsistencies. You're flagged for misconduct. Your academic career ends here.";
		end the story saying "You were caught for questionable research practices.";
	else:
		say "The paper is accepted. Your reputation grows, but you feel uneasy.";
		add "Fabricated data for publication" to Decision Log;
	if Picked Stern is true:
		move the player to Authorship;
	if Picked Vale is true:
		move the player to Plagiarism;

Understand "do not fake" or "stay honest" as staying honest.
Staying honest is an action applying to nothing.

Carry out staying honest:
	say "You decide to be honest and report insufficient data. Your paper is rejected, but your ethical compass is strong.";
	if Picked Stern is true:
		move the player to Authorship;
	if Picked Vale is true:
		move the player to Plagiarism;
[I. DATA CRISIS ENDS HERE]

[II. AUTHORSHIP DISPUTE STARTS HERE]
Understand "confront" as confronting.
Confronting is an action applying to nothing.

Carry out confronting:
	say "You confront your supervisor about the unethical authorship. You may be pushed out of the PhD program based on teir mood.";
	let n be a random number from 1 to 100;
	if n <= 10:
		say "Your career is over before it even started. You were too honest in a cutthroat world.";
		end the story saying "You stood your ground, but it cost your career... For now.";
	else:
		say "You stood your ground and it didn't cost your career, your mentor understands your concerns and values your integrity.";
		move the player to Plagiarism;

Understand "stay silent" as staying silent.
Staying silent is an action applying to nothing.

Carry out staying silent:
    say "You let it go. The paper boosts your profile, but the injustice starts haunting you.";
	add "Accepted paper with unethical authorship" to Decision Log;
    move the player to Plagiarism;
[II. AUTHORSHIP DISPUTE ENDS HERE]

[III. PLAGIARISM STARTS HERE]
Understand "plagiarize" or "copy" as plagiarizing.

Plagiarizing is an action applying to nothing.

Carry out plagiarizing:
	say "You copy large sections from your colleague's paper and submit it as your own.";
	let n be a random number from 1 to 100;
	if n <= 35:
		say "Your plagiarism is detected by the journal's software. Your reputation is ruined.";
		end the story saying "You were caught plagiarizing.";
	else:
		say "Your paper is accepted, but you feel uneasy about your actions.";
		add "Plagiarized a colleague's work" to Decision Log;
		move the player to Grant Misuse;

Understand "write own" or "be honest" as writing honestly.
Understand "be ethical" as writing honestly.
Writing honestly is an action applying to nothing.

Carry out writing honestly:
	say "You work hard and write your own paper. It's not perfect, but it's yours.";
	let n be a random number from 1 to 100;
	if n <= 20:
		say "Your paper is rejected for being too weak. You feel disheartened, but you know you did the right thing.";
		end the story saying "You didn't plagiarize, but you didn't publish either so you perished.";
	else:
		say "Your paper is accepted, and you feel proud of your integrity.";
		move the player to Grant Misuse;
[III. PLAGIARISM ENDS HERE]

[IV. GRANT MISUSE STARTS HERE]
Understand "misuse grant" or "personal expenses" as misusing grant.
Misusing grant is an action applying to nothing.

Carry out misusing grant:
	say "You divert some of the grant money for personal use.";
	let n be a random number from 1 to 100;
	if n <= 15:
		say "An audit uncovers your misuse. You are banned from future funding.";
		end the story saying "You were caught misusing grant funds and you perished.";
	else:
		say "No one notices, but you worry about the risk you took.";
		add "Misused grant funds for personal expenses" to Decision Log;
		move the player to ChatGPT Dilemma;

Understand "use for research" or "follow rules" as using grant properly.
Using grant properly is an action applying to nothing.

Carry out using grant properly:
	say "You use the grant strictly for research, even though it means personal sacrifice.";
	let n be a random number from 1 to 100;
	if n <= 15:
		say "You used your grant funds wisely, but the lab study didn't yield significant results. You didn't publish and you perished.";
		end the story saying "You didn't misuse the grant, but that didn't allow you to publish so you perished.";
	else:
		say "Your research is successful, and you feel good about your choice.";
		move the player to ChatGPT Dilemma;
[IV. GRANT MISUSE ENDS HERE]

[V. CHATGPT DILEMMA STARTS HERE]
Understand "use chatgpt" or "generate text" as using chatgpt.
Using chatgpt is an action applying to nothing.

Carry out using chatgpt:
	say "You use ChatGPT to help write your paper section. The work is easier, but you worry about the unclear policies.";
	let n be a random number from 1 to 100;
	if n <= 55:
		say "A reviewer suspects AI-generated content and your paper is flagged for investigation.";
		end the story saying "Your use of AI led to you not being able to publish and you perished.";
	else:
		say "The paper is accepted. You feel relieved, but uncertain about the ethics.";
		add "Used ChatGPT to generate text" to Decision Log;
		move the player to Data Leak;

Understand "write myself" or "write it myself" as writing myself.
Writing myself is an action applying to nothing.

Carry out writing myself:
	say "You write the section yourself, struggling but learning a lot.";
	let n be a random number from 1 to 100;
	if n <= 15:
		say "It took you too long to write it yourself, and you missed the submission deadline. Your paper is rejected.";
		end the story saying "You perished because you didn't publish.";
	else:
		say "You submit the paper on time, and it is accepted. You feel proud of your integrity.";
		move the player to Data Leak;
[V. CHATGPT DILEMMA ENDS HERE]

[VI. DATA LEAK STARTS HERE]
Understand "report data leak" or "tell someone" as reporting leak.
Reporting leak is an action applying to nothing.

Carry out reporting leak:
	say "You report the data leak to your supervisor and the ethics board.";
	let n be a random number from 1 to 100;
	if n <= 20:
		say "The university investigates, but praises your honesty. You help improve data security, but you didn't get to publish.";
		end the story saying "You perished because you didn't publish.";
	else:
		say "There are consequences, but your honesty is respected.";
		move the player to The Participant Harm;

Understand "fix quietly" or "fix mistake" as fixing quietly.
Fixing quietly is an action applying to nothing.

Carry out fixing quietly:
	say "You try to quietly fix the mistake, hoping no one notices.";
	let n be a random number from 1 to 100;
	if n <= 30:
		say "The leak is discovered later, and you are blamed for a coverup.";
		end the story saying "You were caught trying to cover up a data leak and you perished.";
	else:
		say "No one finds out, but you feel uneasy about your choice.";
		add "Tried to fix data leak quietly" to Decision Log;
		move the player to The Participant Harm;
[VI. DATA LEAK ENDS HERE]

[VII. PARTICIPANT HARM STARTS HERE]
Understand "stop experiment" or "protect participant" as stopping experiment.
Stopping experiment is an action applying to nothing.

Carry out stopping experiment:
	say "You stop the experiment to protect the participant. Your data is incomplete, but you know you did the right thing.";
	let n be a random number from 1 to 100;
	if n <= 10:
		say "The participant is upset about the interruption, but you know you did the right thing.";
		end the story saying "You didn't get to publish... And you perished";	
	else:
		say "The participant appreciates your concern and agrees to help with future studies.";
		move the player to Hall of Fame;
	
Understand "continue experiment" or "continue for data" as continuing experiment.
Continuing experiment is an action applying to nothing.

Carry out continuing experiment:
	say "You continue the experiment despite the participant's distress. The data is strong, but the ethics are questionable.";
	let n be a random number from 1 to 100;
	if n <= 40:
		say "The participant files a complaint. Your research is investigated and halted.";
		end the story saying "You prioritized data over people, and it cost you.";
	else:
		say "No one complains, but you are left with doubts about your choices.";
		add "Continued experiment despite participant distress" to Decision Log;
		move the player to Hall of Fame;
[VII. PARTICIPANT HARM ENDS HERE]

[HALL OF FAME STARTS HERE]
After looking in Hall of Fame:
	if the number of entries in Decision Log is 0:
		say "You navigated the ethical dilemmas without making any questionable decisions. Your integrity shines through.";
		end the story finally saying "You lived with your decisions, and you're proud of your identity.";
	else:
		say "[line break]Here's what keeps you up at night, [PlayerName]:";
		repeat with item running through Decision Log:
			say "[line break]• [item]";
		say "[line break][line break]Your story ends here, but the consequences may not.";
		end the story finally saying "You lived with your decisions".
[HALL OF FAME ENDS HERE]
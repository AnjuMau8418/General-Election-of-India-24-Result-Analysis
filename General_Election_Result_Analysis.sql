-- Total Seats -
SELECT 
DISTINCT COUNT(parliament_constituency) AS Total_Seats
FROM constituencywise_results

-- total number of seats available for the election in each state

SELECT s.state AS State_name, 
COUNT(cr.parliament_constituency) AS Total_Seats
FROM constituencywise_results cr
INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states s ON sr.state_id = s.state_id
GROUP BY s.state

-- Total Seats won by NDA Alliance 
SELECT 
    SUM(CASE 
          WHEN party IN(
		     'Bharatiya Janata Party - BJP', 
             'Telugu Desam - TDP', 
		     'Janata Dal  (United) - JD(U)',
             'Shiv Sena - SHS', 
             'AJSU Party - AJSUP', 
             'Apna Dal (Soneylal) - ADAL', 
             'Asom Gana Parishad - AGP',
             'Hindustani Awam Morcha (Secular) - HAMS', 
             'Janasena Party - JnP', 
	         'Janata Dal  (Secular) - JD(S)',
             'Lok Janshakti Party(Ram Vilas) - LJPRV', 
             'Nationalist Congress Party - NCP',
             'Rashtriya Lok Dal - RLD', 
             'Sikkim Krantikari Morcha - SKM')
		   THEN [Won]
		 ELSE 0
	END) AS NDA_total_Won_Seats
FROM partywise_results

-- Number of Seats won by NDA Alliance Parties

SELECT 
    party as Party_Name,
    Won as Seats_Won
FROM 
    partywise_results
WHERE 
    party IN (
        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
    )
ORDER BY Seats_Won DESC

-- Total Number of Seats won by India Alliance 

SELECT SUM(CASE 
          WHEN party IN(
		        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
		   THEN [Won]
		 ELSE 0
	END) AS India_total_Won_Seats
FROM partywise_results

-- Number of seats won by India Alliance parties

SELECT 
    party as Party_Name,
    Won as Seats_Won
FROM 
    partywise_results
WHERE 
    party IN (
	          'Indian National Congress - INC',
              'Aam Aadmi Party - AAAP',
              'All India Trinamool Congress - AITC',
              'Bharat Adivasi Party - BHRTADVSIP',
              'Communist Party of India  (Marxist) - CPI(M)',
              'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
              'Communist Party of India - CPI',
              'Dravida Munnetra Kazhagam - DMK',
              'Indian Union Muslim League - IUML',
              'Nat`Jammu & Kashmir National Conference - JKN',
              'Jharkhand Mukti Morcha - JMM',
              'Jammu & Kashmir National Conference - JKN',
              'Kerala Congress - KEC',
              'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
              'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
              'Rashtriya Janata Dal - RJD',
              'Rashtriya Loktantrik Party - RLTP',
              'Revolutionary Socialist Party - RSP',
              'Samajwadi Party - SP',
              'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
              'Viduthalai Chiruthaigal Katchi - VCK'
			  )
ORDER BY Seats_Won DESC

--Add a new column field in table partywise_results to get the Party Alliance as NDA, INDIA and OTHER

ALTER TABLE partywise_results
ADD party_Alliance VARCHAR(50)

-- Add India Alliance party

UPDATE partywise_results
SET party_Alliance = 'I.N.D.I.A.'
WHERE party IN (
              'Indian National Congress - INC',
              'Aam Aadmi Party - AAAP',
              'All India Trinamool Congress - AITC',
              'Bharat Adivasi Party - BHRTADVSIP',
              'Communist Party of India  (Marxist) - CPI(M)',
              'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
              'Communist Party of India - CPI',
              'Dravida Munnetra Kazhagam - DMK',
              'Indian Union Muslim League - IUML',
              'Nat`Jammu & Kashmir National Conference - JKN',
              'Jharkhand Mukti Morcha - JMM',
              'Jammu & Kashmir National Conference - JKN',
              'Kerala Congress - KEC',
              'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
              'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
              'Rashtriya Janata Dal - RJD',
              'Rashtriya Loktantrik Party - RLTP',
              'Revolutionary Socialist Party - RSP',
              'Samajwadi Party - SP',
              'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
              'Viduthalai Chiruthaigal Katchi - VCK'
			  );

-- Add NDA Alliance party

UPDATE partywise_results
SET party_Alliance = 'N.D.A.'
Where party IN(
             'Bharatiya Janata Party - BJP', 
             'Telugu Desam - TDP', 
		     'Janata Dal  (United) - JD(U)',
             'Shiv Sena - SHS', 
             'AJSU Party - AJSUP', 
             'Apna Dal (Soneylal) - ADAL', 
             'Asom Gana Parishad - AGP',
             'Hindustani Awam Morcha (Secular) - HAMS', 
             'Janasena Party - JnP', 
		     'Janata Dal  (Secular) - JD(S)',
             'Lok Janshakti Party(Ram Vilas) - LJPRV', 
             'Nationalist Congress Party - NCP',
             'Rashtriya Lok Dal - RLD', 
             'Sikkim Krantikari Morcha - SKM'
			 );

-- For the other parties
UPDATE partywise_results
SET party_Alliance = 'OTHER'
WHERE party_Alliance IS NULL
              
-- Total Number of Seats Won by each Alliance
/*
SELECT party_Alliance, SUM(Won)
FROM partywise_results
GROUP BY party_Alliance
*/


-- Number of seats won by INDIA/NDA Alliance in decreasing order (Alternate Query)
/*
SELECT party, Won
FROM partywise_results
WHERE party_Alliance = 'N.D.A.'
ORDER BY Won DESC
*/

--party Alliance (N.D.A., I.N.D.I.A, or OTHER) that won the most seats across all states

SELECT p.party_Alliance,
       COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
WHERE p.party_Alliance IN ('N.D.A.', 'I.N.D.I.A.', 'OTHER')
GROUP BY p.party_Alliance
ORDER BY Seats_Won DESC;

-- Winning candidate’s name, their party name, part alliance, total votes, and the margin of victory for a
-- specific state and constituency

SELECT 
    cr.Winning_Candidate, pr.party, pr.party_Alliance, cr.total_votes,
    cr.margin,s.state, cr.Constituency_Name
FROM 
    constituencywise_results cr 
INNER JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states s ON sr.State_ID = s.State_ID
WHERE 
    cr.Constituency_Name = 'FAIZABAD'


--distribution of EVM votes versus postal votes for candidates in a specific constituency
SELECT 
   cd.EVM_Votes,
   cd.Postal_Votes,
   cd.Total_Votes,
   cd.Candidate,
   cr.Constituency_Name
FROM 
   constituencywise_results cr 
JOIN 
   constituencywise_details cd
ON cr.Constituency_ID = cd.Constituency_ID
WHERE
   cr.Constituency_Name = 'FAIZABAD'

-- parties that won the most seats in s State, and how many seats did each party win

SELECT 
    p.Party,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
WHERE 
    s.state = 'Uttar Pradesh'
GROUP BY 
    p.Party
ORDER BY 
    Seats_Won DESC;

-- total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in
-- each state for the India Elections 2024

SELECT 
    s.state,
    SUM(CASE WHEN pr.party_alliance = 'N.D.A.' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN pr.party_alliance = 'I.N.D.I.A.' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN pr.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won

FROM 
    constituencywise_results cr
JOIN 
    partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
GROUP BY s.state

--Which candidate received the highest number of EVM votes in each constituency (Top 10)?

SELECT TOP 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM 
    constituencywise_details cd
INNER JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.EVM_Votes DESC;

-- candidate that won and that was the runner-up in each constituency of State for the 2024 elections?

WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID 
		ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Uttar Pradesh'
)

SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;

--For the state of Uttar Pradesh, what are the total number of seats, total number of candidates,
--total number of parties, total votes (including EVM and postal), and the breakdown of EVM and 
--postal votes?

SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM 
    constituencywise_results cr
JOIN 
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    s.State = 'Uttar Pradesh';


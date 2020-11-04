SELECT (SELECT name FROM teams t WHERE t.id = team.id) as name,

-- partidas
(SELECT count(team_1) FROM matches WHERE team_1 = team.id) + (SELECT count(team_2) FROM matches WHERE team_2 = team.id) as matches,

-- vitórias
(SELECT sum(case when team_2_goals > team_1_goals then 1 else 0 END) as victories FROM teams t INNER JOIN matches m ON t.id = m.team_2 WHERE t.id = team.id) + (SELECT sum(case when team_1_goals > team_2_goals then 1 else 0 END) FROM teams t INNER JOIN matches m ON t.id = m.team_1 WHERE t.id = team.id) AS victories,

-- derrotas
(SELECT sum(case when team_2_goals < team_1_goals then 1 else 0 END) as victories FROM teams t INNER JOIN matches m ON t.id = m.team_2 WHERE t.id = team.id) + (SELECT sum(case when team_1_goals < team_2_goals then 1 else 0 END) FROM teams t INNER JOIN matches m ON t.id = m.team_1 WHERE t.id = team.id) as defeats,

-- empates
(SELECT sum(case when team_2_goals = team_1_goals then 1 else 0 END) as victories FROM teams t INNER JOIN matches m ON t.id = m.team_2 WHERE t.id = team.id) + (SELECT sum(case when team_1_goals = team_2_goals then 1 else 0 END) FROM teams t INNER JOIN matches m ON t.id = m.team_1 WHERE t.id = team.id) as draws,

-- pontos
(SELECT sum(case when team_2_goals > team_1_goals then 3 when team_2_goals = team_1_goals then 1 else 0 END) as victories FROM teams t INNER JOIN matches m ON t.id = m.team_2 WHERE t.id = team.id) + (SELECT sum(case when team_1_goals > team_2_goals then 3 when team_1_goals = team_2_goals then 1 else 0 END) FROM teams t INNER JOIN matches m ON t.id = m.team_1 WHERE t.id = team.id) as score 

FROM teams team ORDER BY score DESC
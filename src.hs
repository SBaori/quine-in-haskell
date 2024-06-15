src :: String
src = "?"

getSrc :: String
getSrc = construct src 
    where
        construct :: String -> String
        construct "" = "" 
        construct (c:cs)
            | fromEnum c == 63 = helper src ++ construct cs
            | otherwise = c:construct cs 
            where
                helper :: String -> String
                helper "" = ""
                helper (c:cs)
                    | c == '\n' = '\\':'n':helper cs
                    | c == '\\' = '\\':'\\':helper cs
                    | c == '"' = '\\':'"':helper cs
                    | otherwise = c:helper cs

main :: IO ()
main = putStr getSrc

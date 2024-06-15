src :: String
src = "src :: String\nsrc = \"?\" \n\nprintSrc :: String -> String\nprintSrc \"\" = \"\" \nprintSrc (c:cs)\n    | fromEnum c == 63 = helper src ++ printSrc cs\n    | otherwise = c:printSrc cs \n    where\n        helper \"\" = \"\"\n        helper (c:cs)\n            | c == '\\n' = '\\\\':'n':helper cs\n            | c == '\\\\' = '\\\\':'\\\\':helper cs\n            | c == '\"' = '\\\\':'\"':helper cs\n            | otherwise = c:helper cs\n\nmain :: IO ()\nmain = putStr $ printSrc src" 

printSrc :: String -> String
printSrc "" = "" 
printSrc (c:cs)
    | fromEnum c == 63 = helper src ++ printSrc cs
    | otherwise = c:printSrc cs 
    where
        helper "" = ""
        helper (c:cs)
            | c == '\n' = '\\':'n':helper cs
            | c == '\\' = '\\':'\\':helper cs
            | c == '"' = '\\':'"':helper cs
            | otherwise = c:helper cs

main :: IO ()
main = putStr $ printSrc src

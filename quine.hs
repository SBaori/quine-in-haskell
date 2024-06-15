src :: String
src = "src :: String\nsrc = \"?\"\n\ngetSrc :: String\ngetSrc = construct src \n    where\n        construct :: String -> String\n        construct \"\" = \"\" \n        construct (c:cs)\n            | fromEnum c == 63 = helper src ++ construct cs\n            | otherwise = c:construct cs \n            where\n                helper :: String -> String\n                helper \"\" = \"\"\n                helper (c:cs)\n                    | c == '\\n' = '\\\\':'n':helper cs\n                    | c == '\\\\' = '\\\\':'\\\\':helper cs\n                    | c == '\"' = '\\\\':'\"':helper cs\n                    | otherwise = c:helper cs\n\nmain :: IO ()\nmain = putStr getSrc"

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

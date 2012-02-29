-- 2. Our pretty printer does not take nesting into account.  Whenever we open parentheses, braces or brackets,
-- any lines that follow should be indented so that they are aligned with the opening character until a matching closing character is encountered.
-- Add support for nesting, with a controllable amount of indenentation.



-- Alright then, since we're extending the pretty function, delve into Prettify.hs for our additions to pretty.

-- test cases

let x2 = renderJValue(JArray [JObject [("foo", JBool True), ("quux", JArray [JNumber 3213.0, JBool False, JNumber 24323.0]), ("bar", JNumber 88)], JNumber 2432.0, JBool True ])

*PrettyJSON> putStrLn (pretty 13 x2)
[{foo: true,
quux: [3213.0,
false,
24323.0 ],
bar: 88.0 },
2432.0, true
]

-- whereas we want (nested, no indent) ...
[{foo: true,
 quux: [3213.0,
       false,
       24323.0 ],
 bar: 88.0 },
2432.0, true
]

-- and with indent ...?
[{foo: true,
     quux: [3213.0,
               false,
               24323.0 ],
     bar: 88.0 },
     2432.0, true
]


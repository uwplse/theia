/* goal: lambda x . x */
let idJson = {| {
  "format": "KAST",
  "version": 1,
  "term": {
    "node": "KApply",
    "label": "<k>",
    "variable": false,
    "arity": 1,
    "args": [
      {
        "node": "KApply",
        "label": "lambda_.__LAMBDA",
        "variable": false,
        "arity": 2,
        "args": [
          {
            "node": "KToken",
            "sort": "KVar",
            "token": "x"
          },
          {
            "node": "KToken",
            "sort": "KVar",
            "token": "x"
          }
        ]
      }
    ]
  }
} |};

/* input
<k>
  ( 1 + 2 * 3 ) / 4 ~> #freezer_<=__LAMBDA1_ ( 1 )
</k>
*/
/* goal
[( 1 + 2 * 3 ) / 4] <= 1
*/

let arithmetic1 = {| {
  "format": "KAST",
  "version": 1,
  "term": {
    "node": "KApply",
    "label": "<k>",
    "variable": false,
    "arity": 1,
    "args": [
      {
        "node": "KApply",
        "label": "#KSequence",
        "variable": false,
        "arity": 2,
        "args": [
          {
            "node": "KApply",
            "label": "_/__LAMBDA",
            "variable": false,
            "arity": 2,
            "args": [
              {
                "node": "KApply",
                "label": "_+__LAMBDA",
                "variable": false,
                "arity": 2,
                "args": [
                  {
                    "node": "KToken",
                    "sort": "Int",
                    "token": "1"
                  },
                  {
                    "node": "KApply",
                    "label": "_*__LAMBDA",
                    "variable": false,
                    "arity": 2,
                    "args": [
                      {
                        "node": "KToken",
                        "sort": "Int",
                        "token": "2"
                      },
                      {
                        "node": "KToken",
                        "sort": "Int",
                        "token": "3"
                      }
                    ]
                  }
                ]
              },
              {
                "node": "KToken",
                "sort": "Int",
                "token": "4"
              }
            ]
          },
          {
            "node": "KApply",
            "label": "#freezer_<=__LAMBDA1_",
            "variable": false,
            "arity": 1,
            "args": [
              {
                "node": "KToken",
                "sort": "Int",
                "token": "1"
              }
            ]
          }
        ]
      }
    ]
  }
} |}

/* input
<k>
  1 + 2 * 3 ~> #freezer_/__LAMBDA1_ ( 4 ) ~> #freezer_<=__LAMBDA1_ ( 1 )
</k>
*/
/* goal
[[( 1 + 2 * 3 )] / 4] <= 1
*/

let arithmetic2 = {|
  {
    "format": "KAST",
    "version": 1,
    "term": {
      "node": "KApply",
      "label": "<k>",
      "variable": false,
      "arity": 1,
      "args": [
        {
          "node": "KApply",
          "label": "#KSequence",
          "variable": false,
          "arity": 2,
          "args": [
            {
              "node": "KApply",
              "label": "_+__LAMBDA",
              "variable": false,
              "arity": 2,
              "args": [
                {
                  "node": "KToken",
                  "sort": "Int",
                  "token": "1"
                },
                {
                  "node": "KApply",
                  "label": "_*__LAMBDA",
                  "variable": false,
                  "arity": 2,
                  "args": [
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "2"
                    },
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "3"
                    }
                  ]
                }
              ]
            },
            {
              "node": "KApply",
              "label": "#KSequence",
              "variable": false,
              "arity": 2,
              "args": [
                {
                  "node": "KApply",
                  "label": "#freezer_/__LAMBDA1_",
                  "variable": false,
                  "arity": 1,
                  "args": [
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "4"
                    }
                  ]
                },
                {
                  "node": "KApply",
                  "label": "#freezer_<=__LAMBDA1_",
                  "variable": false,
                  "arity": 1,
                  "args": [
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "1"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  }
|};

let arithmetic3 = {|
  {
    "format": "KAST",
    "version": 1,
    "term": {
      "node": "KApply",
      "label": "<k>",
      "variable": false,
      "arity": 1,
      "args": [
        {
          "node": "KApply",
          "label": "#KSequence",
          "variable": false,
          "arity": 2,
          "args": [
            {
              "node": "KApply",
              "label": "_*__LAMBDA",
              "variable": false,
              "arity": 2,
              "args": [
                {
                  "node": "KToken",
                  "sort": "Int",
                  "token": "2"
                },
                {
                  "node": "KToken",
                  "sort": "Int",
                  "token": "3"
                }
              ]
            },
            {
              "node": "KApply",
              "label": "#KSequence",
              "variable": false,
              "arity": 2,
              "args": [
                {
                  "node": "KApply",
                  "label": "#freezer_+__LAMBDA0_",
                  "variable": false,
                  "arity": 1,
                  "args": [
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "1"
                    }
                  ]
                },
                {
                  "node": "KApply",
                  "label": "#KSequence",
                  "variable": false,
                  "arity": 2,
                  "args": [
                    {
                      "node": "KApply",
                      "label": "#freezer_/__LAMBDA1_",
                      "variable": false,
                      "arity": 1,
                      "args": [
                        {
                          "node": "KToken",
                          "sort": "Int",
                          "token": "4"
                        }
                      ]
                    },
                    {
                      "node": "KApply",
                      "label": "#freezer_<=__LAMBDA1_",
                      "variable": false,
                      "arity": 1,
                      "args": [
                        {
                          "node": "KToken",
                          "sort": "Int",
                          "token": "1"
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  }  
  |};
  
let arithmetic4 = {|{"format":"KAST","version":1,"term":{"node":"KApply","label":"<k>","variable":false,"arity":1,"args":[{"node":"KApply","label":"#KSequence","variable":false,"arity":2,"args":[{"node":"KToken","sort":"Int","token":"6"},{"node":"KApply","label":"#KSequence","variable":false,"arity":2,"args":[{"node":"KApply","label":"#freezer_+__LAMBDA0_","variable":false,"arity":1,"args":[{"node":"KToken","sort":"Int","token":"1"}]},{"node":"KApply","label":"#KSequence","variable":false,"arity":2,"args":[{"node":"KApply","label":"#freezer_/__LAMBDA1_","variable":false,"arity":1,"args":[{"node":"KToken","sort":"Int","token":"4"}]},{"node":"KApply","label":"#freezer_<=__LAMBDA1_","variable":false,"arity":1,"args":[{"node":"KToken","sort":"Int","token":"1"}]}]}]}]}]}}|};

let arithmetic5 = {|{"format":"KAST","version":1,"term":{"node":"KApply","label":"<k>","variable":false,"arity":1,"args":[{"node":"KApply","label":"#KSequence","variable":false,"arity":2,"args":[{"node":"KApply","label":"_+__LAMBDA","variable":false,"arity":2,"args":[{"node":"KToken","sort":"Int","token":"1"},{"node":"KToken","sort":"Int","token":"6"}]},{"node":"KApply","label":"#KSequence","variable":false,"arity":2,"args":[{"node":"KApply","label":"#freezer_/__LAMBDA1_","variable":false,"arity":1,"args":[{"node":"KToken","sort":"Int","token":"4"}]},{"node":"KApply","label":"#freezer_<=__LAMBDA1_","variable":false,"arity":1,"args":[{"node":"KToken","sort":"Int","token":"1"}]}]}]}]}}|}

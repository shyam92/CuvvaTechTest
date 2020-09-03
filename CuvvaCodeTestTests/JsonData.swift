//
//  JsonData.swift
//  CuvvaCodeTestTests
//
//  Created by Shyam Bhudia on 02/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation


let singlePolicyCreatedJson = """
   [{
     "type": "policy_created",
     "timestamp": "2019-02-04T10:52:50.714Z",
     "unique_key": "policy:dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
     "payload": {
       "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
       "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
       "policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
       "original_policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
       "reference_code": "PPKN3VUVQQ",
       "start_date": "2019-02-04T10:52:51.000Z",
       "end_date": "2019-02-04T11:52:51.000Z",
       "incident_phone": "+442038287127",
       "vehicle": {
         "vrm": "LB07SEO",
         "prettyVrm": "LB07 SEO",
         "make": "Volkswagen",
         "model": "Polo",
         "variant": "SE 16V",
         "color": "Silver"
       },
       "documents": {
         "certificate_url":    "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/documents/dev_certdoc_000000BbUEGaXP0JVrZucWjkezioS?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Si  gnature=H8EuIaOwQWnbEVgnUHJol3Wy%2BG4%3D",
         "terms_url":  "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sign  ature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
       }
     }
   }]
   """

let multiplePolicyCreation = """
[{
  "type": "policy_created",
  "timestamp": "2019-02-04T10:52:50.714Z",
  "unique_key": "policy:dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
  "payload": {
    "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
    "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
    "policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
    "original_policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
    "reference_code": "PPKN3VUVQQ",
    "start_date": "2019-02-04T10:52:51.000Z",
    "end_date": "2019-02-04T11:52:51.000Z",
    "incident_phone": "+442038287127",
    "vehicle": {
      "vrm": "LB07SEO",
      "prettyVrm": "LB07 SEO",
      "make": "Volkswagen",
      "model": "Polo",
      "variant": "SE 16V",
      "color": "Silver"
    },
    "documents": {
      "certificate_url":    "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/documents/dev_certdoc_000000BbUEGaXP0JVrZucWjkezioS?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Si  gnature=H8EuIaOwQWnbEVgnUHJol3Wy%2BG4%3D",
      "terms_url":  "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sign  ature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
    }
  }
},
{
  "type": "policy_financial_transaction",
  "timestamp": "2019-02-04T10:52:52.594Z",
  "unique_key": "transaction:dev_tx_000000BbUEGaXP0JWDC4ClGJmMzNA",
  "payload": {
    "policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
    "pricing": {
      "underwriter_premium": 499,
      "commission": 166,
      "total_premium": 665,
      "ipt": 80,
      "ipt_rate": 1200,
      "extra_fees": 125,
      "vat": 0,
      "deductions": 0,
      "total_payable": 870
    }
  }
},
{
  "type": "policy_created",
  "timestamp": "2020-09-01T10:55:24.382Z",
  "unique_key": "policy:dev_pol_000000BbUyt6hezfg0yY3Jqg8i7xw",
  "payload": {
    "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
    "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
    "policy_id": "dev_pol_000000BbUyt6hezfg0yY3Jqg8i7xw",
    "original_policy_id": "dev_pol_000000BbUt5Hp0PqXdbB3kmxXrcky",
    "reference_code": "PFKAJNETQW",
    "start_date": "2020-09-01T10:55:24.382Z",
    "end_date": "2020-09-01T11:55:24.382Z",
    "incident_phone": "+442038287127",
    "vehicle": {
      "vrm": "LB07SEO",
      "prettyVrm": "LB07 SEO",
      "make": "Volkswagen",
      "model": "Polo",
      "variant": "SE 16V",
      "color": "Silver"
    },
    "documents": {
      "certificate_url": "https://cuvva-documents-dev.s3.eu-west-1.amazonaws.com/documents/dev_certdoc_000000BbUyt6hezfgKHOzCa9Uo7e4?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Signature=srPxT2z2H4g3kHRP14C5wUCtpeg%3D",
      "terms_url": "https://cuvva-documents-dev.s3.eu-west-1.amazonaws.com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Signature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
    }
  }
},
{
  "type": "policy_financial_transaction",
  "timestamp": "2020-09-01T10:55:24.382Z",
  "unique_key": "transaction:dev_tx_000000BbUyt6hezfgftYZR6icBOCm",
  "payload": {
    "policy_id": "dev_pol_000000BbUyt6hezfg0yY3Jqg8i7xw",
    "pricing": {
      "underwriter_premium": 178,
      "commission": 59,
      "total_premium": 237,
      "ipt": 28,
      "ipt_rate": 1200,
      "extra_fees": 62,
      "vat": 0,
      "deductions": 0,
      "total_payable": 327
    }
  }
}]
"""
  

   let policyCreatedWithTransaction = """
       [{
          "type": "policy_created",
          "timestamp": "2019-02-04T10:52:50.714Z",
          "unique_key": "policy:dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
          "payload": {
            "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
            "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
            "policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
            "original_policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
            "reference_code": "PPKN3VUVQQ",
            "start_date": "2019-02-04T10:52:51.000Z",
            "end_date": "2019-02-04T11:52:51.000Z",
            "incident_phone": "+442038287127",
            "vehicle": {
              "vrm": "LB07SEO",
              "prettyVrm": "LB07 SEO",
              "make": "Volkswagen",
              "model": "Polo",
              "variant": "SE 16V",
              "color": "Silver"
            },
            "documents": {
              "certificate_url":       "https://cuvva-documents-dev.s3.eu-west-1.amazonaws     .com/documents/dev_certdoc_000000BbUEGaXP0JVrZucWjkezioS?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&S       ignature=H8EuIaOwQWnbEVgnUHJol3Wy%2BG4%3D",
              "terms_url":         "https://cuvva-documents-dev.s3.eu-west-1.amazonaws     .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sig       nature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
            }
          }
        },
        {
          "type": "policy_financial_transaction",
          "timestamp": "2019-02-04T10:52:52.594Z",
          "unique_key": "transaction:dev_tx_000000BbUEGaXP0JWDC4ClGJmMzNA",
          "payload": {
            "policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
            "pricing": {
              "underwriter_premium": 499,
              "commission": 166,
              "total_premium": 665,
              "ipt": 80,
              "ipt_rate": 1200,
              "extra_fees": 125,
              "vat": 0,
              "deductions": 0,
              "total_payable": 870
            }
          }
        }]
       """


let policyExtension = """
    [{
      "type": "policy_created",
      "timestamp": "2019-02-04T12:01:04.283Z",
      "unique_key": "policy:dev_pol_000000BbULZiDhWxIihOrRboycvKq",
      "payload": {
        "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
        "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
        "policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
        "original_policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
        "reference_code": "PFKL3TVVQQ",
        "start_date": "2019-02-04T12:01:04.000Z",
        "end_date": "2019-02-04T13:01:04.000Z",
        "incident_phone": "+442038287127",
        "vehicle": {
          "vrm": "EF51ZNN",
          "prettyVrm": "EF51 ZNN",
          "make": "MINI",
          "model": "Cooper",
          "color": "Blue"
        },
        "documents": {
          "certificate_url":    "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/documents/dev_certdoc_000000BbULZiDhWxJ20FnKLIKiv0y?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Si  gnature=IswwVUW1%2FfFPSiNdPC4cLi%2BAr%2BY%3D",
          "terms_url":  "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sign  ature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
        }
      }
    },
    {
      "type": "policy_financial_transaction",
      "timestamp": "2019-02-04T12:01:06.139Z",
      "unique_key": "transaction:dev_tx_000000BbULZiDhWxJNcPNYrrS6BZg",
      "payload": {
        "policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
        "pricing": {
          "underwriter_premium": 499,
          "commission": 166,
          "total_premium": 665,
          "ipt": 80,
          "ipt_rate": 1200,
          "extra_fees": 125,
          "vat": 0,
          "deductions": 0,
          "total_payable": 870
        }
      }
    },
    {
      "type": "policy_created",
      "timestamp": "2019-02-04T12:16:46.435Z",
      "unique_key": "policy:dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
      "payload": {
        "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
        "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
        "policy_id": "dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
        "original_policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
        "reference_code": "PFKH78TTQW",
        "start_date": "2019-02-04T13:01:04.000Z",
        "end_date": "2019-02-04T13:31:04.000Z",
        "incident_phone": "+442038287127",
        "vehicle": {
          "vrm": "EF51ZNN",
          "prettyVrm": "EF51 ZNN",
          "make": "MINI",
          "model": "Cooper",
          "color": "Blue"
        },
        "documents": {
          "certificate_url":    "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/documents/dev_certdoc_000000BbUNFyNHZ8SeGN1ro2otHu4?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Si  gnature=EaXSqpRKR1XBJZUquShPA7H7OGw%3D",
          "terms_url":  "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sign  ature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
        }
      }
    }]
    """



let policyExtensionWithTransaction = """
[{
  "type": "policy_created",
  "timestamp": "2019-02-04T12:01:04.283Z",
  "unique_key": "policy:dev_pol_000000BbULZiDhWxIihOrRboycvKq",
  "payload": {
    "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
    "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
    "policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
    "original_policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
    "reference_code": "PFKL3TVVQQ",
    "start_date": "2019-02-04T12:01:04.000Z",
    "end_date": "2019-02-04T13:01:04.000Z",
    "incident_phone": "+442038287127",
    "vehicle": {
      "vrm": "EF51ZNN",
      "prettyVrm": "EF51 ZNN",
      "make": "MINI",
      "model": "Cooper",
      "color": "Blue"
    },
    "documents": {
      "certificate_url":    "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/documents/dev_certdoc_000000BbULZiDhWxJ20FnKLIKiv0y?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Si  gnature=IswwVUW1%2FfFPSiNdPC4cLi%2BAr%2BY%3D",
      "terms_url":  "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sign  ature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
    }
  }
},
{
  "type": "policy_financial_transaction",
  "timestamp": "2019-02-04T12:01:06.139Z",
  "unique_key": "transaction:dev_tx_000000BbULZiDhWxJNcPNYrrS6BZg",
  "payload": {
    "policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
    "pricing": {
      "underwriter_premium": 499,
      "commission": 166,
      "total_premium": 665,
      "ipt": 80,
      "ipt_rate": 1200,
      "extra_fees": 125,
      "vat": 0,
      "deductions": 0,
      "total_payable": 870
    }
  }
},
{
  "type": "policy_created",
  "timestamp": "2019-02-04T12:16:46.435Z",
  "unique_key": "policy:dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
  "payload": {
    "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
    "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
    "policy_id": "dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
    "original_policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
    "reference_code": "PFKH78TTQW",
    "start_date": "2019-02-04T13:01:04.000Z",
    "end_date": "2019-02-04T13:31:04.000Z",
    "incident_phone": "+442038287127",
    "vehicle": {
      "vrm": "EF51ZNN",
      "prettyVrm": "EF51 ZNN",
      "make": "MINI",
      "model": "Cooper",
      "color": "Blue"
    },
    "documents": {
      "certificate_url":    "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/documents/dev_certdoc_000000BbUNFyNHZ8SeGN1ro2otHu4?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Si  gnature=EaXSqpRKR1XBJZUquShPA7H7OGw%3D",
      "terms_url":  "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sign  ature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
    }
  }
},
{
   "type": "policy_financial_transaction",
   "timestamp": "2019-02-04T12:16:48.520Z",
   "unique_key": "transaction:dev_tx_000000BbUNFyNHZ8SzsWc6KbwGYSm",
   "payload": {
     "policy_id": "dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
     "pricing": {
       "underwriter_premium": 198,
       "commission": 66,
       "total_premium": 264,
       "ipt": 32,
       "ipt_rate": 1200,
       "extra_fees": 62,
       "vat": 0,
       "deductions": 0,
       "total_payable": 358
     }
   }
 }]
"""

let cancelledPolicy = """
[  {
  "type": "policy_created",
  "timestamp": "2019-02-04T10:52:50.714Z",
  "unique_key": "policy:dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
  "payload": {
    "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
    "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
    "policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
    "original_policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
    "reference_code": "PPKN3VUVQQ",
    "start_date": "2019-02-04T10:52:51.000Z",
    "end_date": "2019-02-04T11:52:51.000Z",
    "incident_phone": "+442038287127",
    "vehicle": {
      "vrm": "LB07SEO",
      "prettyVrm": "LB07 SEO",
      "make": "Volkswagen",
      "model": "Polo",
      "variant": "SE 16V",
      "color": "Silver"
    },
    "documents": {
      "certificate_url": "https://cuvva-documents-dev.s3.eu-west-1.amazonaws.com/documents/dev_certdoc_000000BbUEGaXP0JVrZucWjkezioS?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Signature=H8EuIaOwQWnbEVgnUHJol3Wy%2BG4%3D",
      "terms_url": "https://cuvva-documents-dev.s3.eu-west-1.amazonaws.com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Signature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
    }
  }
},
{
  "type": "policy_financial_transaction",
  "timestamp": "2019-02-04T10:52:52.594Z",
  "unique_key": "transaction:dev_tx_000000BbUEGaXP0JWDC4ClGJmMzNA",
  "payload": {
    "policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
    "pricing": {
      "underwriter_premium": 499,
      "commission": 166,
      "total_premium": 665,
      "ipt": 80,
      "ipt_rate": 1200,
      "extra_fees": 125,
      "vat": 0,
      "deductions": 0,
      "total_payable": 870
    }
  }
},
{
  "type": "policy_cancelled",
  "timestamp": "2019-02-04T12:04:48.669Z",
  "unique_key": "cancellation:dev_polcancel_000000BbULyVLNP373NfaUxX4U4Ke",
  "payload": {
    "policy_id": "dev_pol_000000BbUEGaXP0JVYH3ge0HItj8K",
    "type": "void",
    "new_end_date": null
  }
}]
"""

let cancelledExtensionPolicy = """
[{
  "type": "policy_created",
  "timestamp": "2019-02-04T12:01:04.283Z",
  "unique_key": "policy:dev_pol_000000BbULZiDhWxIihOrRboycvKq",
  "payload": {
    "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
    "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
    "policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
    "original_policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
    "reference_code": "PFKL3TVVQQ",
    "start_date": "2019-02-04T12:01:04.000Z",
    "end_date": "2019-02-04T13:01:04.000Z",
    "incident_phone": "+442038287127",
    "vehicle": {
      "vrm": "EF51ZNN",
      "prettyVrm": "EF51 ZNN",
      "make": "MINI",
      "model": "Cooper",
      "color": "Blue"
    },
    "documents": {
      "certificate_url":    "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/documents/dev_certdoc_000000BbULZiDhWxJ20FnKLIKiv0y?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Si  gnature=IswwVUW1%2FfFPSiNdPC4cLi%2BAr%2BY%3D",
      "terms_url":  "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sign  ature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
    }
  }
},
{
  "type": "policy_financial_transaction",
  "timestamp": "2019-02-04T12:01:06.139Z",
  "unique_key": "transaction:dev_tx_000000BbULZiDhWxJNcPNYrrS6BZg",
  "payload": {
    "policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
    "pricing": {
      "underwriter_premium": 499,
      "commission": 166,
      "total_premium": 665,
      "ipt": 80,
      "ipt_rate": 1200,
      "extra_fees": 125,
      "vat": 0,
      "deductions": 0,
      "total_payable": 870
    }
  }
},
{
  "type": "policy_created",
  "timestamp": "2019-02-04T12:16:46.435Z",
  "unique_key": "policy:dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
  "payload": {
    "user_id": "user_000000BSJ47k7mKYfWUhkWOrxLYGm",
    "user_revision": "dev_profilerev_000000BbFeG7x0I95tMzX7l7VGt9c",
    "policy_id": "dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
    "original_policy_id": "dev_pol_000000BbULZiDhWxIihOrRboycvKq",
    "reference_code": "PFKH78TTQW",
    "start_date": "2019-02-04T13:01:04.000Z",
    "end_date": "2019-02-04T13:31:04.000Z",
    "incident_phone": "+442038287127",
    "vehicle": {
      "vrm": "EF51ZNN",
      "prettyVrm": "EF51 ZNN",
      "make": "MINI",
      "model": "Cooper",
      "color": "Blue"
    },
    "documents": {
      "certificate_url":    "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/documents/dev_certdoc_000000BbUNFyNHZ8SeGN1ro2otHu4?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581783759&Si  gnature=EaXSqpRKR1XBJZUquShPA7H7OGw%3D",
      "terms_url":  "https://cuvva-documents-dev.s3.eu-west-1.amazonaws .com/standard-documents/mulsanne-hourly-terms-policy/5?AWSAccessKeyId=AKIAIOKQ2DGVTKKLGZAA&Expires=1581769754&Sign  ature=ko8kMtW1nQiMxVRDUciqXTZe%2B%2B4%3D"
    }
  }
},
{
  "type": "policy_cancelled",
  "timestamp": "2019-02-04T12:04:48.669Z",
  "unique_key": "cancellation:dev_polcancel_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
  "payload": {
    "policy_id": "dev_pol_000000BbUNFyNHZ8SKxW5z4ZSnIDw",
    "type": "void",
    "new_end_date": null
  }
}]

"""

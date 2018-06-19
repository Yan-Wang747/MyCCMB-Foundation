//
//  SplitViewController.swift
//  MyCCMB Foundation
//
//  Created by Student on 2018-06-15.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {

    let categories = ["Cancer Statistics", "Who are we and what are we known for?", "Foundation funding to CancerCare Manitoba", "How people support the foundation"]
    
    let facts = [["There are over 200 different types of cancers",
                  "60,000 Manitobans are suspected to have cancer each year",
                  "Nearly 7000 Manitobans will receive a cancer diagnosis this year",
                  "19 Manitobans will be told they have cancer each day of the year",
                  "The number of Manitobans diagnosed and living with cancer will increase by 50% over the next decade",
                  "One in two of us will get cancer in our lifetime (national statistic)",
                  "Between 50 to 60 children will be diagnosed with cancer this year (CCMB)",
                  "More than 45% of the new diagnoses in Manitoba will be in people 70 years and older",
                  "There are 45,000 cancer survivors in Manitoba",
                  "The most current Manitoba survival rates for breast, prostate, lung and colon cancer today are 88.5, 90.4, 20.6 and 65 respectively "],
                 
                 ["All funds raised by the Foundation stay in Manitoba",
                  "The Foundation is the only charity exclusively fundraising for CancerCare Manitoba",
                  "There are hundreds of cancer charities in Canada, many of which operate in Manitoba",
                  "CancerCare Manitoba is our province’s cancer control agency responsible for providing treatment and support across the entire cancer service and blood disorders spectrum (early detection, care, research, education and public outreach)",
                  "CCMB’s is known for its tumour bank, Chronic Lymphocytic Leukemia multidisciplinary team, better lung cancer survival rates than the rest of the country, highest per capita participation in pediatric clinical trials in Canada, and highest colorectal cancer screening participation rate in Canada",
                  "Local research and clinical trials are critical because they help develop, recruit and retain the best and brightest team at CancerCare Manitoba who in turn provide the most leading edge treatment to Manitobans living with cancer"],
                 
                 ["The Foundation has granted over $118 million to CancerCare Manitoba since 2000",
                  "The Foundation is granting $7 million to CancerCare Manitoba this year",
                  "The Foundation raises nearly $10 million annually (five year average)",
                  "The Foundation’s annual cost of fundraising is approximately 17% (five year average).  *Industry average is 30%+",
                  "The Foundation has funded $61 million to support local research since 2000, including $3.8 million this year",
                  "The Foundation has funded $12 million to clinical trials since 2000, including $1.04 million this year",
                  "The Foundation has funded $15 million to patient care & support since 2000, including $1.1 million this year",
                  "The Foundation funds basic science (cell), translational (bench to bedside) and clinical research for almost all cancers"],
                 
                 ["Thousands of individual and corporate donors support the Foundation each year",
                  "The Foundation raises funds by/through Signature & Community Events, Memorial/Honour Gifts, Planned Giving, Appeals, Donor Impact Reporting (Annual Report and Newsletters), Monthly Gifts, Major Gifts, Employee Charitable Giving, Radiothon and Raffles",
                  "The Foundation has four Signature Events each in support of different cancers.  They are Challenge for Life 2.0 (all cancers), Guardian Angel (women’s cancer), A Gold-Plated Evening (men’s cancer) and Dragon Boat Festival (pediatric clinical trials)",
                  "Nearly 300 Community Events are organized annually by Manitobans in support of the Foundation",
                  "A Community Event is a third-party event",
                  "You can get involved with the Foundation by volunteering for an event, organizing or hosting a Community Event or making a donation"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for viewController in self.childViewControllers {
            if let master = (viewController as? UINavigationController)?.topViewController as? MasterTableViewController {
                    master.categories = categories
            }
        }
        
        for viewController in self.childViewControllers {
            if let child = (viewController as? UINavigationController)?.topViewController as? ChildTabelViewController {
                child.categories = categories
                child.facts = facts
                child.searchFacts = facts
                child.searchCategories = categories
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

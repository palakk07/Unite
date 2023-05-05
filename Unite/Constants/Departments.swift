//
//  Departments.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import Foundation

enum Departments: String, CaseIterable {
    case educationAndAlliedStudies = "Education and Allied Studies"
    case lettersArtsAndSocialSciences = "Letters, Arts and Social Sciences"
    case science = "Science"
    case businessAndEconomics = "Business & Economics"
    case onlineProgram = "Online Program"
    
    var imgName: String {
        switch self {
            
        case .educationAndAlliedStudies:
            return "educationAndAlliedStudies"
        case .lettersArtsAndSocialSciences:
            return "lettersArtsAndSocialSciences"
        case .science:
            return "science"
        case .businessAndEconomics:
            return "businessAndEconomics"
        case .onlineProgram:
            return "onlineProgram"
        }
    }
    
    var underGraduateMajors: [Majors] {
        switch self {
        case .educationAndAlliedStudies:
            return [.bsHospitalityAndTourism, .bsRecreation, .bsKinesiology]
        case .lettersArtsAndSocialSciences:
            return [
                .baAnthropology,
                .baArt,
                .bfaArt,
                .baCommunication,
                .bsCriminalJustice,
                .baEnglish,
                .baEnvironmentalStudies,
                .baEthnicStudies,
                .baFrench,
                .bsGeography,
                .baGlobalStudies,
                .baHistory,
                .baHumanDevelopment,
                .baLiberalStudies,
                .baMusic,
                .baPhilosophy,
                .baPoliticalScience,
                .baSociology,
                .baSpanish,
                .bsSpeechPathologyAndAudiology,
                .baTheaterArts
            ]
        case .science:
            return [
                .baBiologicalSciencesBiologyEducationConcentration,
                .bsBiologicalSciencesCellularAndMolecularBiology,
                .bsBiologicalSciencesEcologyAndEvolutionaryBiology,
                .bsBiologicalSciencesForensicScience,
                .bsBiologicalSciencesMicrobiologyAndBiomedicalLabSciences,
                .bsBiologicalSciencesPhysiology,
                .baBioChemistry,
                .baBiochemistryEducationConcentration,
                .baChemistry,
                .baChemistryEducationConcentration,
                .bsChemistryBioanalyticalAndForensicsConcentration,
                .bsDataScienceConcentration
            ]
        case .businessAndEconomics:
            return [
                .businessAdministrationBSAccountingConcentration,
                .businessAdministrationBSBusinessEconomicsConcentration,
                .businessAdministrationBSEntrepreneurshipConcentration,
                .businessAdministrationBSFinanceConcentration,
                .businessAdministrationBSGeneralManagementConcentration,
                .businessAdministrationBSHumanResourcesManagementAndOrganizationalBehaviorConcentration,
                .businessAdministrationBSInformationTechnologyManagementConcentration,
                .businessAdministrationBSMarketingManagementConcentration,
                .businessAdministrationBSOperationsAndSupplyChainManagementConcentration,
                .bachelorOfScienceEconomics,
            ]
        case .onlineProgram:
            return []
        }
    }
    
    var graduateMajors: [Majors] {
        switch self {
        case .educationAndAlliedStudies:
            return [.msEducation, .msEducationalLeadership, .msEducationalTechnology, .msCurriculumAnInstruction, .msReading, .msKinesiology, .msCounseling, .msSpecialEducation]
        case .lettersArtsAndSocialSciences:
            return [
                .maCommunication,
                .msHealthcareAdministration,
                .maHistory,
                .maInteractionDesignAndInteractiveArt,
                .maMusic,
                .mpaPublicAdministration,
                .mswSocialWork,
                .msSpeechLanguagePathology,
                .maTesol
            ]
        case .science:
            return [
                .msBiologicalSciences,
                .msMarineScience,
                .msBiostatistics,
                .msStatictics,
                .msStaticticsActuarialScienceConcentration,
                .msStaticticsAppliedStatisticsConcentration,
                .msStaticticsDataScienceConcentration,
                .msStaticticsMathematicalStatisticsConcentration
            ]
        case .businessAndEconomics:
            return [
                .masterScienceAccountancy,
                .msEconomics,
                .masterScienceBusinessAnalytics,
                .mbaAnalyticsManagersConcentration,
                .mbaFinanceConcentration,
                .mbaGeneralBusinessConcentration,
                .mbaHumanResourcesManagementAndOrganizationalBehaviorConcentration,
                .mbaMarketingManagementConcentration,
                .mbaOperationsAndSupplyChainManagementStrategyAndInnovationConcentration,
                .mbaGlobalInnovators
            ]
        case .onlineProgram:
            return [
                .msElearning,
                .msHospitalityRecreationAndTourism
                
            ]
        }
    }
}

enum StudentStatus: String, CaseIterable {
    case underGraduate = "Under Graduate"
    case graduate = "Graduate"
    case alumni = "Alumni"
    case needMentor = "Need a Mentor"
    case becomeMentor = "Want to be Mentor"
    
    var imgName: String {
        switch self {
        case .underGraduate:
            return "underGraduate"
        case .graduate:
            return "graduate"
        case .alumni:
            return "alumni"
        case .needMentor:
            return "mentor1"
        case .becomeMentor:
            return "mentor2"
        }
    }
}

enum Majors: String, CaseIterable {
    case bsHospitalityAndTourism = "B.S. in Hospitality and Tourism"
    case bsRecreation = "B.S. in Recreation"
    case bsKinesiology = "B.S. in Kinesiology"
    
    case msEducation = "M.S. in Education"
    case msEducationalLeadership = "M.S. in Educational Leadership"
    case msEducationalTechnology = "M.S. in Educational Technology"
    case msCurriculumAnInstruction = "M.S. in Curriculum and Instruction"
    case msReading = "M.S. in Reading"
    case msKinesiology = "M.S. in Kinesiology"
    case msCounseling = "M.S. in Counseling"
    case msSpecialEducation = "M.S. in Special Education"
    
    case businessAdministrationBSAccountingConcentration = "Business Administration, B.S.Accounting Concentration"
    case businessAdministrationBSBusinessEconomicsConcentration = "Business Administration, b.s. business economics concentration"
    case businessAdministrationBSEntrepreneurshipConcentration = "Business Administration, B.S.Entrepreneurship Concentration"
    case businessAdministrationBSFinanceConcentration = "Business Administration, B.S.Finance Concentration"
    case businessAdministrationBSGeneralManagementConcentration = "Business Administration, B.S.General Management Concentration"
    case businessAdministrationBSHumanResourcesManagementAndOrganizationalBehaviorConcentration = "Business Administration, B.S.Human Resources Management & Organizational Behavior Concentration"
    case businessAdministrationBSInformationTechnologyManagementConcentration = "Business Administration, B.S.Information Technology Management Concentration"
    case businessAdministrationBSMarketingManagementConcentration = "Business Administration, B.S.Marketing Management Concentration"
    case businessAdministrationBSOperationsAndSupplyChainManagementConcentration = "Business Administration, B.S.Operations and Supply Chain Management Concentration"
    case bachelorOfScienceEconomics = "Bachelor of Science in Economics"
    
    case masterScienceAccountancy = "Master of Science in Accountancy"
    case msEconomics = "MS Economics"
    case masterScienceBusinessAnalytics = "Master of Science in Business Analytics"
    case mbaAnalyticsManagersConcentration = "MBA with Analytics for Managers Concentration"
    case mbaFinanceConcentration = "MBA with Finance Concentration"
    case mbaGeneralBusinessConcentration = "MBA with General Business Concentration"
    case mbaHumanResourcesManagementAndOrganizationalBehaviorConcentration = "MBA with Human Resources Management and Organizational Behavior Concentration"
    case mbaMarketingManagementConcentration = "MBA with Marketing Management Concentration"
    case mbaOperationsAndSupplyChainManagementStrategyAndInnovationConcentration = "MBA with Operations & Supply Chain Management Strategy and Innovation Concentration"
    case mbaGlobalInnovators = "MBA for Global Innovators"
    
    case baAnthropology = "B.A. Anthropology"
    case baArt = "B.A. Art"
    case bfaArt = "B.F.A. Art"
    case baCommunication = "B.A. Communication"
    case bsCriminalJustice = "B.S. Criminal Justice"
    case baEnglish = "B.A. English"
    case baEnvironmentalStudies = "B.A. Environmental Studies"
    case baEthnicStudies = "B.A. Ethnic Studies"
    case baFrench = "B.A. French"
    case bsGeography = "B.S. Geography"
    case baGlobalStudies = "B.A. Global Studies"
    case baHistory = "B.A. History"
    case baHumanDevelopment = "B.A. Human Development"
    case baLiberalStudies = "B.A. Liberal Studies"
    case baMusic = "B.A. Music"
    case baPhilosophy = "B.A. Philosophy"
    case baPoliticalScience = "B.A. Political Science"
    case baSociology = "B.A. Sociology"
    case baSpanish = "B.A. Spanish"
    case bsSpeechPathologyAndAudiology = "B.S. Speech Pathology & Audiology"
    case baTheaterArts = "B.A. Theater Arts"
    
    case maCommunication = "M.A. Communication"
    case msHealthcareAdministration = "M.S. Healthcare Administration"
    case maHistory = "M.A. History"
    case maInteractionDesignAndInteractiveArt = "M.A. Interaction Design and Interactive Art"
    case maMusic = "M.A. Music"
    case mpaPublicAdministration = "M.P.A. Public Administration"
    case mswSocialWork = "M.S.W. Social Work"
    case msSpeechLanguagePathology = "M.S. Speech Language Pathology"
    case maTesol = "M.A. TESOL"
    
    case baBiologicalSciencesBiologyEducationConcentration = "B.A., Biological Sciences - Biology Education Concentration"
    case bsBiologicalSciencesCellularAndMolecularBiology = "B.S., Biological Sciences - Concentration in Cellular & Molecular Biology"
    case bsBiologicalSciencesEcologyAndEvolutionaryBiology = "B.S., Biological Sciences - Concentration in Ecology & Evolutionary Biology"
    case bsBiologicalSciencesForensicScience = "B.S., Biological Sciences - Concentration in Forensic Science"
    case bsBiologicalSciencesMicrobiologyAndBiomedicalLabSciences = "B.S., Biological Sciences - Concentration in Microbiology and Biomedical Lab Sciences"
    case bsBiologicalSciencesPhysiology = "B.S., Biological Sciences - Concentration in Physiology"
    case baBioChemistry = "B.A. Biochemistry"
    case baBiochemistryEducationConcentration = "B.A. Biochemistry, Chemistry Education Concentration"
    case baChemistry = "B.A. Chemistry"
    case baChemistryEducationConcentration = "B.A. Chemistry, Chemistry Education Concentration"
    case bsChemistryBioanalyticalAndForensicsConcentration = "B.S. Chemistry, Bioanalytical and Forensics Concentration"
    case bsDataScienceConcentration = "Statistics, B.S.Statistics, B.S.: Data Science Concentration"
    
    case msBiologicalSciences = "M.S., Biological Sciences"
    case msMarineScience = "M.S., Marine Science"
    case msBiostatistics = "Biostatistics, M.S."
    case msStatictics = "Statistics, M.S."
    case msStaticticsActuarialScienceConcentration = "Statistics, M.S.: Actuarial Science Concentration"
    case msStaticticsAppliedStatisticsConcentration = "Statistics, M.S.: Applied Statistics Concentration"
    case msStaticticsDataScienceConcentration = "Statistics, M.S.: Data Science Concentration"
    case msStaticticsMathematicalStatisticsConcentration = "Statistics, M.S.: Mathematical Statistics Concentration"
    
    case msElearning = "M.S. in eLearning"
    case msHospitalityRecreationAndTourism = "M.S. in Hospitality, Recreation and Tourism"
}

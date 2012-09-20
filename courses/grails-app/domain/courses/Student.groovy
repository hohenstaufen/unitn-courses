package courses


class Student {

    Integer id
    String firstName
    String lastName
    String fullName
    String phdCycle
    Boolean isSuspended
    Integer courseYear
    Boolean admittedConditionally
    String legalResidence
    String currentDomicile
    Date dateOfBirth
    String placeOfBirth
    String officePhone
    String mobilePhone
    String officeWorkingPlace
    String lockerNumber
    Boolean phdScholarship
    String scholarshipType
    Integer yearlyFeeToCenter
    Integer yearlyFeeToSchool
    Boolean hasPcRights
    String preDoctoralScholarship
    Integer monthsPredocScholarship
    String yearExtensionScholarship
    Integer months
    Integer personalFundsAvailable
    Boolean isGraduated
    Date graduationDate
    String commiteeMembers
    String email
    Boolean deleted = false
    Integer italianTaxpayerCode
    Boolean isPlanApproved = false
    String photoProfile

    // TODO: This is totally broken! must change ASAP
    Integer fundingInstitution = 1
    Integer fundsOwner = 1

    Supervisor tutor
    Supervisor currentAdvisor
    University universityOfProvenance
    Country citizenship
    University university
    Country countryOfProvenance

    static hasMany = [courseEnrollments: CourseEnrollment,
                      userCredentials: UserCredential]
    static belongsTo = [Country, Supervisor, University]

    //static fetchMode = [courseEnrollments: 'eager']

    static mapping = {
        table "students"
        id column: "user_ID"
        tutor column: "tutor"
        currentAdvisor column: "current_advisor"
        universityOfProvenance column: "university_of_provenance"
        citizenship column: "citizenship"
        university column: "university"
        countryOfProvenance column: "country_of_provenance"
        fundingInstitution column: "funding_institution"
        fundsOwner column: "funds_owner"

        courseEnrollments ignoreNotFound: true

        version false
    }

    static constraints = {
        firstName maxSize: 120, blank: false
        lastName maxSize: 300, blank: false
        fullName maxSize: 500
        phdCycle maxSize: 10
        legalResidence maxSize: 500
        currentDomicile maxSize: 500
        dateOfBirth nullable: true, maxSize: 10
        placeOfBirth maxSize: 300
        officePhone maxSize: 100
        mobilePhone maxSize: 100
        officeWorkingPlace maxSize: 200
        lockerNumber maxSize: 60
        phdScholarship nullable: true
        scholarshipType maxSize: 500
        preDoctoralScholarship nullable: true, maxSize: 500
        yearExtensionScholarship maxSize: 100
        graduationDate nullable: true, maxSize: 10
        commiteeMembers maxSize: 20
        email maxSize: 200
        italianTaxpayerCode nullable: true
        photoProfile nullable: true
    }

    static namedQueries = {
        notDeleted {
            ne 'deleted', true
        }
    }

    String toString() { "${this.class.name} : $id - $firstName $lastName" }


    /**
     * Returns true if the study plan of the current student is correct
     *  Total credits should be greater or equal than 24
     *  First year: at least 15 credits
     *  Second and third year: at least 9 credits
     *  Note: Study plans must include Research Methodologies
     */
    Boolean check_studyplan() {

        this.refresh()
        def totalCredits = 0
        def hasResearchMethodologies = false

        for (enrollment in this.courseEnrollments) {
            if (enrollment.course.credits) {
                totalCredits += enrollment.course.credits
                if (enrollment.course.courseName.toLowerCase() == "research methodologies") {
                    hasResearchMethodologies = true
                }
            }
        }

        if (this.courseYear == 1) {
            return hasResearchMethodologies && totalCredits >= 15
        }
        else {
            return hasResearchMethodologies && totalCredits >= 9
        }
    }


    /**
     * Checks if a student is enrolled in the given course
     */
    Boolean isEnrolled(Course courseInstance) {
        this.refresh()

        // TODO really inefficient, fix ASAP
        for (enrollment in this.courseEnrollments) {
            if (enrollment.course == courseInstance) {
                return true
            }
        }
        return false
    }
}

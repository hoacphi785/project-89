module MyModule::AchievementBadges {

    use aptos_framework::signer;
    use std::vector;

    /// Struct representing a badge.
    struct Badge has store, key {
        description: vector<u8>,  // Description of the achievement badge
        issued: bool,             // Whether the badge has been issued
    }

    /// Function to issue an achievement badge to a student.
    public fun issue_badge(issuer: &signer, student: address, description: vector<u8>) {
        let badge = Badge {
            description,
            issued: true,
        };
        move_to(issuer, badge);
    }

    /// Function to check if a student has received a specific badge.
    public fun check_badge(student: address): vector<u8> acquires Badge {
        let badge = borrow_global<Badge>(student);
        badge.description
    }
}

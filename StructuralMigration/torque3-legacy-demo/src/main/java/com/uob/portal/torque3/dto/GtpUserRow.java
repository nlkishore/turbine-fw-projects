package com.uob.portal.torque3.dto;

import java.util.Objects;

/**
 * Row DTO for {@code gtp_user} (legacy layer maps Village {@link com.workingdogs.village.Record} here).
 */
public final class GtpUserRow {

    private final Integer userId;
    private final String loginName;
    private final String passwordValue;
    private final String firstName;
    private final String lastName;
    private final String email;

    public GtpUserRow(
            Integer userId,
            String loginName,
            String passwordValue,
            String firstName,
            String lastName,
            String email) {
        this.userId = userId;
        this.loginName = loginName;
        this.passwordValue = passwordValue;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getLoginName() {
        return loginName;
    }

    public String getPasswordValue() {
        return passwordValue;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "GtpUserRow{"
                + "userId="
                + userId
                + ", loginName='"
                + loginName
                + '\''
                + ", firstName='"
                + firstName
                + '\''
                + ", lastName='"
                + lastName
                + '\''
                + ", email='"
                + email
                + '\''
                + '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GtpUserRow that = (GtpUserRow) o;
        return Objects.equals(userId, that.userId) && Objects.equals(loginName, that.loginName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, loginName);
    }
}

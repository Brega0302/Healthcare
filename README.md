# Healthcare Management System Database

A comprehensive MySQL database system for managing healthcare operations including patient records, appointments, medical histories, prescriptions, and audit logging.

## Database Overview

**Database Name:** `healthcare`  
**Engine:** MariaDB 10.4.32  
**Character Set:** utf8mb4  
**Collation:** utf8mb4_general_ci

## Table Structure

### Core Tables

#### 1. **patients**
Stores patient demographic and contact information.

| Column | Type | Description |
|--------|------|-------------|
| patient_id | INT (PK) | Unique patient identifier |
| name | VARCHAR(100) | Patient's full name |
| email | VARCHAR(255) | Patient email (unique) |
| password_hash | VARCHAR(255) | Hashed password for authentication |
| dob | DATE | Date of birth |
| blood_type | ENUM | Blood type (A+, A-, B+, B-, AB+, AB-, O+, O-) |
| phone | VARCHAR(15) | Contact phone number |
| insurance_id | VARCHAR(20) | Insurance identifier |
| created_at | TIMESTAMP | Account creation timestamp |

**Current Records:** 15 patients

#### 2. **doctors**
Stores physician information and credentials.

| Column | Type | Description |
|--------|------|-------------|
| doctor_id | INT (PK) | Unique doctor identifier |
| name | VARCHAR(100) | Doctor's full name |
| email | VARCHAR(255) | Doctor email (unique) |
| password_hash | VARCHAR(255) | Hashed password for authentication |
| specialization | ENUM | Medical specialization |
| license_number | VARCHAR(20) | Medical license number (unique) |
| created_at | TIMESTAMP | Account creation timestamp |

**Specializations Available:**
- Cardiologist
- Orthopedic
- Surgeon
- Neurologist
- Pediatrician

**Current Records:** 5 doctors

#### 3. **appointments**
Manages patient-doctor appointments and scheduling.

| Column | Type | Description |
|--------|------|-------------|
| appointment_id | INT (PK) | Unique appointment identifier |
| patient_id | INT (FK) | References patients table |
| doctor_id | INT (FK) | References doctors table |
| appointment_time | DATETIME | Scheduled date and time |
| status | ENUM | Appointment status |
| notes | TEXT | Appointment notes |

**Status Values:**
- Scheduled
- Completed
- Cancelled
- No-Show

**Current Records:** 30 appointments

#### 4. **medicalrecords**
Stores patient medical histories and diagnoses.

| Column | Type | Description |
|--------|------|-------------|
| record_id | INT (PK) | Unique record identifier |
| patient_id | INT (FK) | References patients table |
| doctor_id | INT (FK) | References doctors table |
| diagnosis | TEXT | Medical diagnosis |
| treatment_notes | TEXT | Treatment plan and notes |
| allergies | TEXT | Known allergies |
| created_at | TIMESTAMP | Record creation timestamp |

**Current Records:** 15 medical records

#### 5. **treatments**
Tracks specific treatments provided to patients.

| Column | Type | Description |
|--------|------|-------------|
| treatment_id | INT (PK) | Unique treatment identifier |
| record_id | INT (FK) | References medicalrecords table |
| description | TEXT | Treatment description |
| date | DATE | Treatment date |

**Current Records:** 15 treatments

#### 6. **medications**
Master list of available medications.

| Column | Type | Description |
|--------|------|-------------|
| medication_id | INT (PK) | Unique medication identifier |
| name | VARCHAR(100) | Medication name |
| description | TEXT | Medication description and purpose |
| side_effects | TEXT | Known side effects |

**Current Records:** 10 medications

#### 7. **prescriptions**
Links treatments with prescribed medications.

| Column | Type | Description |
|--------|------|-------------|
| prescription_id | INT (PK) | Unique prescription identifier |
| treatment_id | INT (FK) | References treatments table |
| medication_id | INT (FK) | References medications table |
| dosage | VARCHAR(50) | Dosage instructions |
| start_date | DATE | Prescription start date |
| end_date | DATE | Prescription end date (nullable) |

**Current Records:** 18 prescriptions

### Supporting Tables

#### 8. **patientdocuments**
Manages patient document uploads (lab results, imaging, etc.).

| Column | Type | Description |
|--------|------|-------------|
| document_id | INT (PK) | Unique document identifier |
| patient_id | INT (FK) | References patients table |
| file_name | VARCHAR(255) | Original file name |
| file_path | VARCHAR(255) | Server file path |
| file_type | VARCHAR(50) | File type (PDF, JPEG, DICOM, etc.) |
| uploaded_at | TIMESTAMP | Upload timestamp |

**Supported File Types:** PDF, JPEG, DICOM, DOCX, ZIP, MP4

**Current Records:** 15 documents

#### 9. **notifications**
Manages system notifications for patients and doctors.

| Column | Type | Description |
|--------|------|-------------|
| notification_id | INT (PK) | Unique notification identifier |
| user_id | INT | User identifier (patient or doctor) |
| user_type | ENUM | Recipient type (patient/doctor) |
| title | VARCHAR(100) | Notification title |
| message | TEXT | Notification message |
| is_read | TINYINT(1) | Read status flag |
| created_at | TIMESTAMP | Notification creation timestamp |

**Current Records:** 20 notifications

#### 10. **correction_requests**
Tracks patient requests for medical record corrections.

| Column | Type | Description |
|--------|------|-------------|
| request_id | INT (PK) | Unique request identifier |
| patient_id | INT (FK) | References patients table |
| record_id | INT (FK) | References medicalrecords table |
| current_value | TEXT | Existing record value |
| requested_value | TEXT | Requested correction |
| status | ENUM | Request status (Pending/Approved/Rejected) |
| created_at | TIMESTAMP | Request creation timestamp |
| reviewed_by | INT (FK) | Doctor who reviewed (nullable) |
| reviewed_at | DATETIME | Review timestamp (nullable) |

**Current Records:** 5 correction requests

#### 11. **auditlogs**
Security and compliance audit trail.

| Column | Type | Description |
|--------|------|-------------|
| log_id | INT (PK) | Unique log identifier |
| user_id | INT | User performing action |
| action | VARCHAR(50) | Action performed |
| target_id | INT | Target record ID (nullable) |
| ip_address | VARCHAR(45) | Source IP address |
| timestamp | TIMESTAMP | Action timestamp |

**Logged Actions:**
- VIEW_PATIENT_RECORD
- UPDATE_PATIENT_RECORD
- SYSTEM_BACKUP
- LOGIN
- FAILED_LOGIN
- PASSWORD_CHANGE
- EXPORT_RECORDS
- MEDICATION_OVERRIDE
- SECURITY_ALERT
- PRIVILEGE_ESCALATION
- AUDIT_REPORT
- SYSTEM_UPDATE

**Current Records:** 20 audit log entries

## Database Views

The system includes 8 pre-defined views for common queries:

1. **view_upcoming_appointments** - Shows all scheduled future appointments
2. **view_doctor_appointment_counts** - Aggregates appointments by doctor and status
3. **view_pending_correction_requests** - Lists pending record correction requests
4. **view_auditlog_actions** - Summarizes audit log actions by user
5. **view_completed_appointments** - Shows historical completed appointments
6. **view_recent_audit_logs** - Displays audit logs from the last 30 days
7. **view_doctor_list** - Simplified doctor directory
8. **view_correction_request_statuses** - Aggregates correction requests by status

## Relationships

### Foreign Key Constraints

- **appointments** → patients, doctors
- **medicalrecords** → patients, doctors
- **treatments** → medicalrecords
- **prescriptions** → treatments, medications
- **patientdocuments** → patients (CASCADE DELETE)
- **correction_requests** → patients, medicalrecords, doctors

## Installation

### Prerequisites

- MySQL 5.7+ or MariaDB 10.4+
- phpMyAdmin (optional, for web-based management)
- Sufficient storage for patient documents

### Setup Instructions

1. **Import the database:**
   ```bash
   mysql -u root -p < healthcare_database.sql
   ```

2. **Verify installation:**
   ```sql
   USE healthcare;
   SHOW TABLES;
   ```

3. **Check data integrity:**
   ```sql
   SELECT COUNT(*) FROM patients;
   SELECT COUNT(*) FROM doctors;
   SELECT COUNT(*) FROM appointments;
   ```

## Usage Examples

### Query all appointments for a specific patient
```sql
SELECT a.*, d.name AS doctor_name
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.patient_id = 1
ORDER BY a.appointment_time DESC;
```

### Get patient's complete medical history
```sql
SELECT p.name, mr.diagnosis, mr.treatment_notes, mr.allergies, mr.created_at
FROM patients p
JOIN medicalrecords mr ON p.patient_id = mr.patient_id
WHERE p.patient_id = 1;
```

### Find all prescriptions for a patient
```sql
SELECT p.name, m.name AS medication, pr.dosage, pr.start_date, pr.end_date
FROM patients p
JOIN medicalrecords mr ON p.patient_id = mr.patient_id
JOIN treatments t ON mr.record_id = t.record_id
JOIN prescriptions pr ON t.treatment_id = pr.treatment_id
JOIN medications m ON pr.medication_id = m.medication_id
WHERE p.patient_id = 1;
```

### View upcoming appointments (using view)
```sql
SELECT * FROM view_upcoming_appointments
ORDER BY appointment_time;
```

### Check recent audit activity
```sql
SELECT * FROM view_recent_audit_logs
ORDER BY timestamp DESC
LIMIT 10;
```

## Security Features

1. **Password Hashing:** All user passwords are stored using bcrypt hashing ($2a$10$...)
2. **Audit Logging:** Comprehensive tracking of all data access and modifications
3. **IP Address Tracking:** All actions logged with source IP for security analysis
4. **Unique Constraints:** Email and license numbers are unique to prevent duplicates
5. **Foreign Key Constraints:** Maintains referential integrity across tables

## Data Privacy Considerations

This database contains **Protected Health Information (PHI)** and must comply with:

- **HIPAA** (Health Insurance Portability and Accountability Act)
- **GDPR** (if serving EU patients)
- Local healthcare data protection regulations

### Recommended Security Measures:

1. Enable SSL/TLS for all database connections
2. Implement row-level security where appropriate
3. Regular security audits and log reviews
4. Encrypted backups stored securely
5. Access control based on role (doctor, patient, admin)
6. Regular password rotation policies
7. Two-factor authentication for user accounts

## Backup and Maintenance

### Recommended Backup Schedule

```bash
# Daily backup
mysqldump -u root -p healthcare > backup_$(date +%Y%m%d).sql

# Weekly full backup with compression
mysqldump -u root -p healthcare | gzip > backup_$(date +%Y%m%d).sql.gz
```

### Maintenance Tasks

- **Daily:** Review audit logs for suspicious activity
- **Weekly:** Check for pending correction requests
- **Monthly:** Archive old completed appointments
- **Quarterly:** Review and update medication list
- **Annually:** Audit user accounts and permissions

## Sample Data

The database comes pre-populated with sample data:
- 15 patients with diverse medical conditions
- 5 doctors across different specializations
- 30 appointments (mix of scheduled and completed)
- 15 medical records with diagnoses
- 18 active prescriptions
- 20 notification examples
- 5 correction requests in various states

## Future Enhancements

Potential improvements for this system:

- [ ] Billing and insurance claims table
- [ ] Lab results table with reference ranges
- [ ] Pharmacy integration table
- [ ] Appointment reminder system
- [ ] Patient portal access logs
- [ ] Telemedicine session tracking
- [ ] Medical imaging metadata table
- [ ] Referral tracking system
- [ ] Vaccination records
- [ ] Emergency contact information

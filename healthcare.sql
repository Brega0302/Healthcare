-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2025 at 05:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcare`
--
CREATE DATABASE IF NOT EXISTS `healthcare` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `healthcare`;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_time` datetime NOT NULL,
  `status` enum('Scheduled','Completed','Cancelled','No-Show') DEFAULT 'Scheduled',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_id`, `appointment_time`, `status`, `notes`) VALUES
(1, 1, 1, '2024-06-10 09:00:00', 'Completed', 'BP check. No side effects from medication.'),
(2, 1, 1, '2024-07-15 10:30:00', 'Scheduled', 'Follow-up for hypertension management'),
(3, 2, 2, '2024-06-12 14:00:00', 'Completed', 'Cast check. Healing well.'),
(4, 2, 2, '2024-07-20 11:00:00', 'Scheduled', 'Cast removal appointment'),
(5, 3, 3, '2024-06-15 13:30:00', 'Completed', 'Blood sugar levels improving with Metformin'),
(6, 3, 3, '2024-07-22 09:15:00', 'Scheduled', 'Diabetes management review'),
(7, 4, 4, '2024-06-18 10:00:00', 'Completed', 'Migraine frequency reduced with Sumatriptan'),
(8, 4, 4, '2024-07-25 14:45:00', 'Scheduled', 'Neurological follow-up'),
(9, 5, 5, '2024-06-20 08:30:00', 'Completed', 'Pre-op assessment for appendectomy'),
(10, 5, 5, '2024-06-27 07:00:00', 'Completed', 'Appendectomy performed successfully'),
(11, 6, 1, '2024-06-22 11:15:00', 'Completed', 'Cholesterol levels improved with Atorvastatin'),
(12, 6, 1, '2024-08-01 10:00:00', 'Scheduled', 'Lipid panel follow-up'),
(13, 7, 2, '2024-06-25 15:30:00', 'Completed', 'Ankle sprain healing well with RICE protocol'),
(14, 7, 2, '2024-07-05 16:00:00', 'Completed', 'Final check - ankle fully recovered'),
(15, 8, 3, '2024-06-28 09:45:00', 'Completed', 'Asthma control improved with Albuterol'),
(16, 8, 3, '2024-08-10 13:30:00', 'Scheduled', 'Pulmonary function test'),
(17, 9, 4, '2024-07-01 14:00:00', 'Completed', 'Anxiety symptoms reduced with Sertraline'),
(18, 9, 4, '2024-08-15 10:15:00', 'Scheduled', 'Medication efficacy review'),
(19, 10, 5, '2024-07-03 07:30:00', 'Completed', 'Pre-op consultation for cholecystectomy'),
(20, 10, 5, '2024-07-10 06:45:00', 'Completed', 'Gallbladder surgery completed'),
(21, 11, 1, '2024-07-05 13:00:00', 'Completed', 'Arrhythmia controlled with Metoprolol'),
(22, 11, 1, '2024-08-20 11:45:00', 'Scheduled', 'EKG follow-up'),
(23, 12, 2, '2024-07-08 10:30:00', 'Completed', 'Osteoarthritis pain management plan'),
(24, 12, 2, '2024-08-25 14:00:00', 'Scheduled', 'Physical therapy evaluation'),
(25, 13, 3, '2024-07-11 08:15:00', 'Completed', 'Anemia improving with iron supplements'),
(26, 13, 3, '2024-08-30 09:30:00', 'Scheduled', 'CBC recheck'),
(27, 14, 4, '2024-07-14 16:45:00', 'Completed', 'Seizure frequency reduced with Levetiracetam'),
(28, 14, 4, '2024-09-05 15:15:00', 'Scheduled', 'EEG follow-up'),
(29, 15, 5, '2024-07-17 12:00:00', 'Completed', 'GERD symptoms controlled with Omeprazole'),
(30, 15, 5, '2024-09-10 08:45:00', 'Scheduled', 'Endoscopy follow-up');

-- --------------------------------------------------------

--
-- Table structure for table `auditlogs`
--

DROP TABLE IF EXISTS `auditlogs`;
CREATE TABLE `auditlogs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auditlogs`
--

INSERT INTO `auditlogs` (`log_id`, `user_id`, `action`, `target_id`, `ip_address`, `timestamp`) VALUES
(1, 1, 'VIEW_PATIENT_RECORD', 1, '192.168.1.101', '2024-05-10 07:15:00'),
(2, 2, 'VIEW_PATIENT_RECORD', 2, '192.168.1.102', '2024-05-05 12:30:00'),
(3, 3, 'VIEW_PATIENT_RECORD', 3, '192.168.1.103', '2024-05-03 09:20:00'),
(4, 4, 'VIEW_PATIENT_RECORD', 4, '192.168.1.104', '2024-05-07 08:45:00'),
(5, 5, 'VIEW_PATIENT_RECORD', 5, '192.168.1.105', '2024-05-04 06:00:00'),
(6, 1, 'UPDATE_PATIENT_RECORD', 1, '192.168.1.101', '2024-05-15 14:20:00'),
(7, 2, 'UPDATE_PATIENT_RECORD', 2, '192.168.1.102', '2024-05-12 11:10:00'),
(8, 3, 'UPDATE_PATIENT_RECORD', 3, '192.168.1.103', '2024-05-20 07:30:00'),
(9, 4, 'UPDATE_PATIENT_RECORD', 4, '192.168.1.104', '2024-05-09 13:40:00'),
(10, 5, 'UPDATE_PATIENT_RECORD', 5, '192.168.1.105', '2024-05-06 08:15:00'),
(11, 0, 'SYSTEM_BACKUP', NULL, '10.0.0.1', '2024-05-15 00:00:00'),
(12, 1, 'LOGIN', NULL, '192.168.1.101', '2024-05-10 06:55:00'),
(13, 2, 'FAILED_LOGIN', NULL, '192.168.1.150', '2024-05-11 17:30:00'),
(14, 3, 'PASSWORD_CHANGE', NULL, '192.168.1.103', '2024-05-18 09:05:00'),
(15, 4, 'EXPORT_RECORDS', 4, '192.168.1.104', '2024-05-14 12:20:00'),
(16, 5, 'MEDICATION_OVERRIDE', 10, '192.168.1.105', '2024-05-17 07:45:00'),
(17, 1, 'SECURITY_ALERT', NULL, '192.168.1.101', '2024-05-22 14:30:00'),
(18, 2, 'PRIVILEGE_ESCALATION', NULL, '192.168.1.102', '2024-05-25 08:10:00'),
(19, 3, 'AUDIT_REPORT', NULL, '192.168.1.103', '2024-05-28 11:15:00'),
(20, 4, 'SYSTEM_UPDATE', NULL, '192.168.1.104', '2024-06-01 01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `correction_requests`
--

DROP TABLE IF EXISTS `correction_requests`;
CREATE TABLE `correction_requests` (
  `request_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `current_value` text NOT NULL,
  `requested_value` text NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `correction_requests`
--

INSERT INTO `correction_requests` (`request_id`, `patient_id`, `record_id`, `current_value`, `requested_value`, `status`, `created_at`, `reviewed_by`, `reviewed_at`) VALUES
(1, 1, 1, 'Hypertension', 'Pre-hypertension', 'Pending', '2025-04-03 11:59:00', NULL, NULL),
(2, 3, 3, 'Type 2 Diabetes', 'Type 1 Diabetes', 'Rejected', '2025-04-03 11:59:00', NULL, NULL),
(3, 5, 5, 'Appendicitis', 'Gastritis', 'Pending', '2025-04-03 11:59:00', NULL, NULL),
(4, 10, 10, 'Gallstones', 'Indigestion', 'Approved', '2025-04-03 11:59:00', NULL, NULL),
(5, 12, 12, 'Osteoarthritis', 'Rheumatoid arthritis', 'Pending', '2025-04-03 11:59:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `specialization` enum('Cardiologist','Orthopedic','Surgeon','Neurologist','Pediatrician') DEFAULT NULL,
  `license_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `name`, `email`, `password_hash`, `specialization`, `license_number`, `created_at`) VALUES
(1, 'Dr. Sarah Miller', 'sarah.m@clinic.com', '$2a$10$sarah...', 'Cardiologist', 'MD10001', '2025-04-03 11:52:05'),
(2, 'Dr. David Wilson', 'david.w@clinic.com', '$2a$10$david...', 'Orthopedic', 'MD10002', '2025-04-03 11:52:05'),
(3, 'Dr. Olivia Chen', 'olivia.c@clinic.com', '$2a$10$olivia..', 'Pediatrician', 'MD10003', '2025-04-03 11:52:05'),
(4, 'Dr. Robert Johnson', 'robert.j@clinic.com', '$2a$10$robert.', 'Neurologist', 'MD10004', '2025-04-03 11:52:05'),
(5, 'Dr. Jennifer Davis', 'jennifer.d@clinic.com', '$2a$10$jennife.', 'Surgeon', 'MD10005', '2025-04-03 11:52:05');

-- --------------------------------------------------------

--
-- Table structure for table `medicalrecords`
--

DROP TABLE IF EXISTS `medicalrecords`;
CREATE TABLE `medicalrecords` (
  `record_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment_notes` text DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicalrecords`
--

INSERT INTO `medicalrecords` (`record_id`, `patient_id`, `doctor_id`, `diagnosis`, `treatment_notes`, `allergies`, `created_at`) VALUES
(1, 1, 1, 'Hypertension', 'Prescribed Lisinopril 10mg daily. Monitor BP weekly.', 'Penicillin', '2025-04-03 11:52:13'),
(2, 2, 2, 'Fractured tibia', 'Casted for 6 weeks. Follow-up in 4 weeks.', 'None', '2025-04-03 11:52:13'),
(3, 3, 3, 'Type 2 Diabetes', 'Metformin 500mg twice daily. Lifestyle counseling.', 'Sulfa drugs', '2025-04-03 11:52:13'),
(4, 4, 4, 'Migraine', 'Prescribed Sumatriptan 50mg as needed.', 'Codeine', '2025-04-03 11:52:13'),
(5, 5, 5, 'Appendicitis', 'Scheduled for appendectomy next week.', 'Latex', '2025-04-03 11:52:13'),
(6, 6, 1, 'High cholesterol', 'Atorvastatin 20mg daily. Low-fat diet recommended.', 'None', '2025-04-03 11:52:13'),
(7, 7, 2, 'Sprained ankle', 'RICE protocol. Follow-up in 2 weeks.', 'Ibuprofen', '2025-04-03 11:52:13'),
(8, 8, 3, 'Asthma', 'Albuterol inhaler prescribed. Avoid triggers.', 'Dust mites', '2025-04-03 11:52:13'),
(9, 9, 4, 'Anxiety disorder', 'Started on Sertraline 50mg daily.', 'None', '2025-04-03 11:52:13'),
(10, 10, 5, 'Gallstones', 'Recommended cholecystectomy.', 'None', '2025-04-03 11:52:13'),
(11, 11, 1, 'Arrhythmia', 'Prescribed Metoprolol 25mg twice daily.', 'Shellfish', '2025-04-03 11:52:13'),
(12, 12, 2, 'Osteoarthritis', 'Physical therapy scheduled. Acetaminophen as needed.', 'None', '2025-04-03 11:52:13'),
(13, 13, 3, 'Anemia', 'Iron supplements prescribed. Follow-up in 1 month.', 'None', '2025-04-03 11:52:13'),
(14, 14, 4, 'Epilepsy', 'Levetiracetam 500mg twice daily.', 'None', '2025-04-03 11:52:13'),
(15, 15, 5, 'GERD', 'Omeprazole 20mg daily. Avoid spicy foods.', 'None', '2025-04-03 11:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
CREATE TABLE `medications` (
  `medication_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `side_effects` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`medication_id`, `name`, `description`, `side_effects`) VALUES
(1, 'Lisinopril', 'ACE inhibitor for hypertension', 'Dizziness, dry cough'),
(2, 'Metformin', 'Oral hypoglycemic for diabetes', 'Nausea, diarrhea'),
(3, 'Ibuprofen', 'NSAID for pain/inflammation', 'Stomach irritation'),
(4, 'Atorvastatin', 'Cholesterol medication', 'Muscle pain, liver enzyme changes'),
(5, 'Albuterol', 'Bronchodilator for asthma', 'Nervousness, tremor'),
(6, 'Sumatriptan', 'Migraine medication', 'Chest tightness, dizziness'),
(7, 'Sertraline', 'SSRI antidepressant', 'Insomnia, sexual dysfunction'),
(8, 'Metoprolol', 'Beta blocker for arrhythmia', 'Fatigue, cold hands/feet'),
(9, 'Levetiracetam', 'Antiepileptic drug', 'Drowsiness, mood changes'),
(10, 'Omeprazole', 'PPI for GERD', 'Headache, diarrhea');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('patient','doctor') NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `user_type`, `title`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 'patient', 'Lab Results Available', 'Your bloodwork from 06/01/2024 is now available', 0, '2024-06-02 06:15:00'),
(2, 1, 'patient', 'Appointment Reminder', 'Upcoming cardiology visit on 06/10 at 9:00 AM', 0, '2024-06-08 16:30:00'),
(3, 2, 'patient', 'Imaging Results', 'Your tibia X-ray results have been posted', 0, '2024-05-16 08:45:00'),
(4, 3, 'patient', 'Medication Refill', 'Metformin prescription is due for renewal', 0, '2024-05-28 12:20:00'),
(5, 4, 'patient', 'New Message', 'Dr. Johnson sent you a secure message', 0, '2024-05-11 09:05:00'),
(6, 5, 'patient', 'Pre-Op Instructions', 'Review your appendectomy preparation materials', 0, '2024-05-26 07:00:00'),
(7, 6, 'patient', 'Billing Statement', 'New statement available for your cholesterol panel', 0, '2024-06-06 14:40:00'),
(8, 7, 'patient', 'Physical Therapy Update', 'New exercises added to your recovery plan', 0, '2024-05-20 11:15:00'),
(9, 8, 'patient', 'Allergy Alert', 'Pollen count high today - consider precautions', 0, '2024-05-30 05:00:00'),
(10, 9, 'patient', 'Medication Adjustment', 'Sertraline dosage increased to 75mg daily', 0, '2024-06-03 08:30:00'),
(11, 1, 'doctor', 'New Test Results', 'Patient #6 - Abnormal EKG requires review', 0, '2024-06-06 06:45:00'),
(12, 2, 'doctor', 'Schedule Change', 'OR time added for 06/15 at 7:30 AM', 0, '2024-06-01 14:20:00'),
(13, 3, 'doctor', 'Vaccine Alert', 'Flu shots now available for pediatric patients', 0, '2024-05-25 07:10:00'),
(14, 4, 'doctor', 'Prior Authorization Needed', 'Patient #14 requires EEG approval', 0, '2024-05-18 12:50:00'),
(15, 5, 'doctor', 'Surgical Pathology', 'Appendectomy results for patient #5 available', 0, '2024-05-28 09:25:00'),
(16, 1, 'doctor', 'Medication Interaction', 'Patient #1 - New prescription may interact with current regimen', 0, '2024-05-21 08:15:00'),
(17, 3, 'doctor', 'Insurance Update', 'Patient #8 - New insurance requires recredentialing', 0, '2024-06-04 11:40:00'),
(18, 4, 'doctor', 'Research Opportunity', 'New migraine study accepting participants', 0, '2024-05-22 13:30:00'),
(19, 2, 'doctor', 'Equipment Maintenance', 'X-ray machine #2 requires calibration', 0, '2024-06-07 05:50:00'),
(20, 5, 'doctor', 'Patient Survey', 'Patient #10 rated their surgical experience', 0, '2024-05-29 10:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `patientdocuments`
--

DROP TABLE IF EXISTS `patientdocuments`;
CREATE TABLE `patientdocuments` (
  `document_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patientdocuments`
--

INSERT INTO `patientdocuments` (`document_id`, `patient_id`, `file_name`, `file_path`, `file_type`, `uploaded_at`) VALUES
(5, 1, 'emma_johnson_bloodwork.pdf', '/uploads/patients/1/bloodwork_20240601.pdf', 'PDF', '2025-04-03 11:57:28'),
(6, 2, 'james_wilson_xray_tibia.jpg', '/uploads/patients/2/xray_tibia_20240515.jpg', 'JPEG', '2025-04-03 11:57:28'),
(7, 3, 'sophia_chen_glucose_tests.pdf', '/uploads/patients/3/glucose_results_20240520.pdf', 'PDF', '2025-04-03 11:57:28'),
(8, 4, 'michael_brown_mri_brain.dcm', '/uploads/patients/4/mri_brain_20240510.dcm', 'DICOM', '2025-04-03 11:57:28'),
(9, 5, 'olivia_davis_ultrasound_abdomen.pdf', '/uploads/patients/5/ultrasound_20240525.pdf', 'PDF', '2025-04-03 11:57:28'),
(10, 6, 'william_martinez_ekg_results.pdf', '/uploads/patients/6/ekg_20240605.pdf', 'PDF', '2025-04-03 11:57:28'),
(11, 7, 'ava_anderson_ankle_mri.dcm', '/uploads/patients/7/mri_ankle_20240518.dcm', 'DICOM', '2025-04-03 11:57:28'),
(12, 8, 'benjamin_taylor_pulmonary_test.pdf', '/uploads/patients/8/pulmonary_20240610.pdf', 'PDF', '2025-04-03 11:57:28'),
(13, 9, 'mia_thomas_psych_eval.docx', '/uploads/patients/9/evaluation_20240530.docx', 'DOCX', '2025-04-03 11:57:28'),
(14, 10, 'lucas_garcia_ct_abdomen.pdf', '/uploads/patients/10/ct_scan_20240522.pdf', 'PDF', '2025-04-03 11:57:28'),
(15, 11, 'charlotte_lee_holter_monitor.zip', '/uploads/patients/11/holter_20240615.zip', 'ZIP', '2025-04-03 11:57:28'),
(16, 12, 'henry_clark_bone_scan.jpg', '/uploads/patients/12/bone_scan_20240528.jpg', 'JPEG', '2025-04-03 11:57:28'),
(17, 13, 'amelia_rodriguez_blood_panel.pdf', '/uploads/patients/13/blood_panel_20240608.pdf', 'PDF', '2025-04-03 11:57:28'),
(18, 14, 'alexander_hernandez_eeg_results.pdf', '/uploads/patients/14/eeg_20240512.pdf', 'PDF', '2025-04-03 11:57:28'),
(19, 15, 'emily_king_endoscopy_video.mp4', '/uploads/patients/15/endoscopy_20240530.mp4', 'MP4', '2025-04-03 11:57:28');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `blood_type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `insurance_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `name`, `email`, `password_hash`, `dob`, `blood_type`, `phone`, `insurance_id`, `created_at`) VALUES
(1, 'Emma Johnson', 'emma.j@clinic.com', '$2a$10$emma...', '1990-05-15', 'A+', '+15551234567', 'INS001', '2025-04-03 11:51:58'),
(2, 'James Wilson', 'james.w@clinic.com', '$2a$10$james..', '1985-11-22', 'O-', '+15559876543', 'INS002', '2025-04-03 11:51:58'),
(3, 'Sophia Chen', 'sophia.c@clinic.com', '$2a$10$sophia..', '1978-03-30', 'B+', '+15555551234', 'INS003', '2025-04-03 11:51:58'),
(4, 'Michael Brown', 'michael.b@clinic.com', '$2a$10$michael.', '1995-07-18', 'AB+', '+15556667788', 'INS004', '2025-04-03 11:51:58'),
(5, 'Olivia Davis', 'olivia.d@clinic.com', '$2a$10$olivia..', '1982-09-25', 'A-', '+15557778899', 'INS005', '2025-04-03 11:51:58'),
(6, 'William Martinez', 'william.m@clinic.com', '$2a$10$william.', '1973-12-05', 'O+', '+15558889900', 'INS006', '2025-04-03 11:51:58'),
(7, 'Ava Anderson', 'ava.a@clinic.com', '$2a$10$ava.....', '1992-04-12', 'B-', '+15559990011', 'INS007', '2025-04-03 11:51:58'),
(8, 'Benjamin Taylor', 'benjamin.t@clinic.com', '$2a$10$benjami.', '1988-08-30', 'A+', '+15551112233', 'INS008', '2025-04-03 11:51:58'),
(9, 'Mia Thomas', 'mia.t@clinic.com', '$2a$10$mia.....', '1975-06-20', 'AB-', '+15552223344', 'INS009', '2025-04-03 11:51:58'),
(10, 'Lucas Garcia', 'lucas.g@clinic.com', '$2a$10$lucas...', '1998-01-07', 'O-', '+15553334455', 'INS010', '2025-04-03 11:51:58'),
(11, 'Charlotte Lee', 'charlotte.l@clinic.com', '$2a$10$charlot.', '1980-10-15', 'B+', '+15554445566', 'INS011', '2025-04-03 11:51:58'),
(12, 'Henry Clark', 'henry.c@clinic.com', '$2a$10$henry...', '1970-02-28', 'A+', '+15555556677', 'INS012', '2025-04-03 11:51:58'),
(13, 'Amelia Rodriguez', 'amelia.r@clinic.com', '$2a$10$amelia..', '1993-07-03', 'O+', '+15556667788', 'INS013', '2025-04-03 11:51:58'),
(14, 'Alexander Hernandez', 'alexander.h@clinic.com', '$2a$10$alexand.', '1987-11-11', 'A-', '+15557778899', 'INS014', '2025-04-03 11:51:58'),
(15, 'Emily King', 'emily.k@clinic.com', '$2a$10$emily...', '1979-04-09', 'AB+', '+15558889900', 'INS015', '2025-04-03 11:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
CREATE TABLE `prescriptions` (
  `prescription_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `medication_id` int(11) NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`prescription_id`, `treatment_id`, `medication_id`, `dosage`, `start_date`, `end_date`) VALUES
(21, 1, 1, 'Lisinopril 10mg PO daily', '2024-05-10', NULL),
(22, 6, 4, 'Atorvastatin 20mg PO nightly', '2024-05-12', '2024-11-12'),
(23, 11, 8, 'Metoprolol 25mg PO BID', '2024-05-18', NULL),
(24, 2, 3, 'Ibuprofen 600mg PO Q6H PRN pain', '2024-05-05', '2024-06-05'),
(25, 7, 3, 'Ibuprofen 400mg PO TID', '2024-05-08', '2024-05-22'),
(26, 12, 3, 'Acetaminophen 500mg PO Q6H PRN', '2024-05-15', NULL),
(27, 3, 2, 'Metformin 500mg PO BID', '2024-05-03', NULL),
(28, 8, 5, 'Albuterol inhaler 2 puffs Q4H PRN', '2024-05-09', NULL),
(29, 4, 6, 'Sumatriptan 50mg PO PRN migraine', '2024-05-07', NULL),
(30, 9, 7, 'Sertraline 50mg PO daily', '2024-05-11', NULL),
(31, 14, 9, 'Levetiracetam 500mg PO BID', '2024-05-16', NULL),
(32, 5, 10, 'Cefazolin 1g IV Q8H', '2024-05-04', '2024-05-06'),
(33, 15, 10, 'Omeprazole 20mg PO daily', '2024-05-17', '2024-08-17'),
(34, 1, 3, 'Hydrochlorothiazide 12.5mg PO daily PRN edema', '2024-05-20', NULL),
(35, 3, 2, 'Empagliflozin 10mg PO daily', '2024-05-25', NULL),
(36, 8, 5, 'Fluticasone inhaler 2 puffs daily', '2024-05-28', NULL),
(37, 11, 8, 'Aspirin 81mg PO daily', '2024-06-01', NULL),
(38, 14, 9, 'Clonazepam 0.5mg PO PRN anxiety', '2024-06-05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
CREATE TABLE `treatments` (
  `treatment_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`treatment_id`, `record_id`, `description`, `date`) VALUES
(1, 1, 'Hypertension management: ACE inhibitor therapy initiated', '2024-05-10'),
(2, 6, 'Hyperlipidemia treatment: Statin therapy and dietary changes', '2024-05-12'),
(3, 11, 'Arrhythmia control: Beta-blocker regimen established', '2024-05-18'),
(4, 2, 'Tibia fracture: Closed reduction and casting', '2024-05-05'),
(5, 7, 'Ankle sprain: RICE protocol and NSAIDs', '2024-05-08'),
(6, 12, 'Osteoarthritis: Physical therapy plan developed', '2024-05-15'),
(7, 3, 'Type 2 Diabetes: Metformin and lifestyle modification', '2024-05-03'),
(8, 8, 'Asthma: Rescue inhaler and trigger avoidance plan', '2024-05-09'),
(9, 13, 'Iron-deficiency anemia: Supplementation started', '2024-05-14'),
(10, 4, 'Migraine: Abortive medication protocol', '2024-05-07'),
(11, 9, 'Generalized anxiety disorder: SSRI initiated', '2024-05-11'),
(12, 14, 'Epilepsy: Anticonvulsant therapy adjusted', '2024-05-16'),
(13, 5, 'Appendicitis: Pre-op IV antibiotics', '2024-05-04'),
(14, 10, 'Cholelithiasis: Surgical consult completed', '2024-05-13'),
(15, 15, 'GERD: PPI therapy and dietary counseling', '2024-05-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `auditlogs`
--
ALTER TABLE `auditlogs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `correction_requests`
--
ALTER TABLE `correction_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `reviewed_by` (`reviewed_by`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `license_number` (`license_number`);

--
-- Indexes for table `medicalrecords`
--
ALTER TABLE `medicalrecords`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `idx_patient` (`patient_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`medication_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `patientdocuments`
--
ALTER TABLE `patientdocuments`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `treatment_id` (`treatment_id`),
  ADD KEY `medication_id` (`medication_id`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`treatment_id`),
  ADD KEY `record_id` (`record_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auditlogs`
--
ALTER TABLE `auditlogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `correction_requests`
--
ALTER TABLE `correction_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medicalrecords`
--
ALTER TABLE `medicalrecords`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `medication_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `patientdocuments`
--
ALTER TABLE `patientdocuments`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);

--
-- Constraints for table `correction_requests`
--
ALTER TABLE `correction_requests`
  ADD CONSTRAINT `correction_requests_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `correction_requests_ibfk_2` FOREIGN KEY (`record_id`) REFERENCES `medicalrecords` (`record_id`),
  ADD CONSTRAINT `correction_requests_ibfk_3` FOREIGN KEY (`reviewed_by`) REFERENCES `doctors` (`doctor_id`);

--
-- Constraints for table `medicalrecords`
--
ALTER TABLE `medicalrecords`
  ADD CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `medicalrecords_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);

--
-- Constraints for table `patientdocuments`
--
ALTER TABLE `patientdocuments`
  ADD CONSTRAINT `patientdocuments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`treatment_id`),
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`);

--
-- Constraints for table `treatments`
--
ALTER TABLE `treatments`
  ADD CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `medicalrecords` (`record_id`);
COMMIT;

-- --------------------------------------------------------
-- View: view_upcoming_appointments
CREATE OR REPLACE VIEW view_upcoming_appointments AS
SELECT 
    appointment_id,
    patient_id,
    doctor_id,
    appointment_time,
    status,
    notes
FROM appointments
WHERE appointment_time > NOW()
  AND status = 'Scheduled';

-- --------------------------------------------------------
-- View: view_doctor_appointment_counts
CREATE OR REPLACE VIEW view_doctor_appointment_counts AS
SELECT 
    doctor_id,
    status,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id, status;

-- --------------------------------------------------------
-- View: view_pending_correction_requests
CREATE OR REPLACE VIEW view_pending_correction_requests AS
SELECT 
    request_id,
    patient_id,
    record_id,
    current_value,
    requested_value,
    created_at
FROM correction_requests
WHERE status = 'Pending';

-- --------------------------------------------------------
-- View: view_auditlog_actions
CREATE OR REPLACE VIEW view_auditlog_actions AS
SELECT 
    user_id,
    action,
    COUNT(*) AS total_actions
FROM auditlogs
GROUP BY user_id, action;

-- --------------------------------------------------------
-- View: view_completed_appointments
CREATE OR REPLACE VIEW view_completed_appointments AS
SELECT 
    appointment_id,
    patient_id,
    doctor_id,
    appointment_time,
    notes
FROM appointments
WHERE status = 'Completed';

-- --------------------------------------------------------
-- View: view_recent_audit_logs
CREATE OR REPLACE VIEW view_recent_audit_logs AS
SELECT 
    log_id,
    user_id,
    action,
    target_id,
    ip_address,
    timestamp
FROM auditlogs
WHERE timestamp >= NOW() - INTERVAL 30 DAY;

-- --------------------------------------------------------
-- View: view_doctor_list
CREATE OR REPLACE VIEW view_doctor_list AS
SELECT 
    doctor_id,
    name,
    email,
    specialization,
    license_number,
    created_at
FROM doctors;

-- --------------------------------------------------------
-- View: view_correction_request_statuses
CREATE OR REPLACE VIEW view_correction_request_statuses AS
SELECT 
    status,
    COUNT(*) AS total_requests
FROM correction_requests
GROUP BY status;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

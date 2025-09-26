-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 15, 2025 at 09:19 PM
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
-- Database: `pharma-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `archived_orders`
--

CREATE TABLE `archived_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('tablet','syrup','injection','ointment','other') NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `price_purchase` decimal(10,2) NOT NULL,
  `price_sell` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `expiry_date` date NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `type`, `barcode`, `price_purchase`, `price_sell`, `quantity`, `expiry_date`, `supplier_id`, `description`) VALUES
(1, 'Quitapex 200mg Tablet', 'tablet', '3464028339618', 7.00, 10.00, 126, '2028-03-20', 2, 'Treatment of SchizophreniaTreatment of Mania'),
(2, 'Co-Diovan 40/12.5mg Tablet', 'tablet', '5573008308889', 80.50, 115.00, 169, '2026-03-11', 2, ' Hypertension (high blood pressure)'),
(3, 'Pioz 7.5mg Tablet', 'tablet', '5302182372371', 182.00, 260.00, 171, '2027-08-14', 1, 'Treatment of Type 2 diabetes mellitus'),
(4, 'Lyrica 50mg Capsule', 'tablet', '1616495798978', 116.90, 167.00, 116, '2026-04-21', 2, 'Treatment of Neuropathic painTreatment of Epilepsy/SeizuresTreatment of Fibromyalgia'),
(5, 'Prontogest 300mg SR Capsule', 'tablet', '6253683654591', 220.50, 315.00, 110, '2027-10-14', 2, ' Hormone replacement therapyTreatment of Female infertility'),
(6, 'Sodium Hyaluronate (88mg)', 'other', '4182836255512', 13.30, 19.00, 158, '2027-05-11', 1, 'Treatment of Osteoarthritis'),
(7, 'Hydrochlorothiazide (12.5mg) + Olmesartan Medoxomil (40mg)', 'other', '7944237020686', 277.90, 397.00, 78, '2028-06-01', 1, ' Hypertension (high blood pressure)'),
(8, 'Sertaconazole (2% w/w)', 'other', '2460619737053', 282.10, 403.00, 168, '2028-05-08', 2, 'Treatment of Fungal skin infectionsTreatment of Fungal infections'),
(9, 'Measles Vaccine (Live) (1000ccid50) + Mumps Virus Vaccine (5000ccid50) + Rubella vaccine (Live) (1000ccid50)', 'other', '7554567707031', 11.90, 17.00, 67, '2026-10-27', 2, ' Prevention of Measles Prevention of Rubella Prevention of Mumps'),
(10, 'Metoprolol Succinate (95mg)', 'other', '2483698515170', 56.70, 81.00, 153, '2028-01-27', 2, 'Treatment of Hypertension (high blood pressure)Treatment of Angina (heart-related chest pain)Treatment of ArrhythmiaPrevention of Heart attackPrevention of Migraine'),
(11, 'Amlodipine (2.5mg) + Atenolol (50mg)', 'other', '5453535512373', 11.90, 17.00, 177, '2027-01-17', 1, 'Treatment of Hypertension (high blood pressure)'),
(12, 'Metformin  (1000mg) +  Vildagliptin (50mg)', 'other', '6338579063290', 241.50, 345.00, 194, '2027-08-31', 1, 'Treatment of Type 2 diabetes mellitus'),
(13, 'Cefixime (100mg)', 'other', '4559183439018', 19.60, 28.00, 128, '2026-01-20', 2, 'Treatment of Bacterial infections'),
(14, 'Glimepiride (1mg)', 'other', '4016673543760', 184.10, 263.00, 97, '2028-10-08', 2, 'Treatment of Type 2 diabetes mellitus'),
(15, 'Losartan (50mg)', 'other', '5849311936869', 149.80, 214.00, 100, '2027-01-20', 2, 'Treatment of Hypertension (high blood pressure)Treatment of Heart failure Prevention of heart attack and stroke'),
(16, 'Ofloxacin (100mg)', 'other', '1507282820188', 77.70, 111.00, 147, '2026-10-29', 2, 'Treatment of Bacterial infections'),
(17, 'Betahistine (16mg)', 'other', '6201919098267', 92.40, 132.00, 131, '2027-07-30', 2, 'Treatment of Meniere\'s disease'),
(18, 'Insulin Isophane/NPH   (50%) +   Human Insulin/Soluble Insulin (50%)', 'other', '1847744171355', 37.80, 54.00, 57, '2026-01-09', 1, ' Diabetes'),
(19, 'Epalrestat (150mg)', 'other', '7541769197758', 146.30, 209.00, 165, '2028-04-01', 1, ' Diabetic nerve pain'),
(20, 'Melatonin (5mg)', 'other', '9645755851442', 217.00, 310.00, 58, '2026-10-13', 1, 'Treatment of InsomniaTreatment of Jet lag'),
(21, 'Ketoconazole (2% w/v) + Coal Tar (4% w/v)', 'other', '4459402684916', 107.80, 154.00, 122, '2028-04-24', 2, 'Treatment of Dandruff'),
(22, 'Sodium Hyaluronate (0.1% w/v)', 'other', '8826984947022', 238.00, 340.00, 196, '2026-08-01', 1, 'Treatment of Dry eyes'),
(23, 'Fexofenadine (180mg)', 'other', '9880284574594', 136.50, 195.00, 83, '2028-11-06', 1, 'Treatment of Sneezing and runny nose due to allergiesTreatment of Allergic conditions'),
(24, 'Fluocinolone acetonide (0.025% w/v)', 'other', '4153533248119', 75.60, 108.00, 158, '2027-05-24', 2, ' Skin conditions with inflammation & itching'),
(25, 'Domperidone (30mg) + Pantoprazole (40mg)', 'other', '6732488868984', 189.00, 270.00, 80, '2028-03-23', 2, 'Treatment of Gastroesophageal reflux disease (Acid reflux)Treatment of Peptic ulcer disease'),
(26, 'Metformin  (50mg) +  Vildagliptin (1000mg)', 'other', '2366295237221', 114.10, 163.00, 59, '2027-07-30', 1, 'Treatment of Type 2 diabetes mellitus'),
(27, 'Bromelain (180mg) + Trypsin (96mg) + Rutoside (200mg)', 'other', '3002881940970', 176.40, 252.00, 176, '2027-10-29', 2, ' Pain relief'),
(28, 'Rasagiline (1mg)', 'other', '4022406544819', 187.60, 268.00, 105, '2028-08-28', 1, 'Treatment of Parkinson\'s disease'),
(29, 'Pregabalin (75mg)', 'other', '8544555326615', 183.40, 262.00, 84, '2028-02-08', 2, 'Treatment of Neuropathic painTreatment of Epilepsy/SeizuresTreatment of Fibromyalgia'),
(30, 'Vildagliptin (50mg)', 'other', '7276616275942', 53.90, 77.00, 112, '2027-02-04', 1, 'Treatment of Type 2 diabetes mellitus'),
(31, 'Diclofenac (100mg)', 'other', '9690373685078', 275.10, 393.00, 125, '2026-02-09', 1, ' Pain relief'),
(32, 'Fluvoxamine (100mg)', 'other', '8009574486913', 244.30, 349.00, 114, '2026-04-17', 1, ' Depression Obsessive-compulsive disorder'),
(33, 'Nadifloxacin (1% w/w)', 'other', '9595928118717', 130.90, 187.00, 128, '2026-12-16', 2, 'Treatment of Bacterial skin infections'),
(34, 'Moxifloxacin (0.5% w/v)', 'other', '6390615748813', 94.50, 135.00, 137, '2027-03-30', 1, 'Treatment of Bacterial eye infections'),
(35, 'Pramipexole (1.5mg)', 'other', '1670140209331', 27.30, 39.00, 175, '2026-03-03', 2, ' Parkinson\'s disease Restless leg syndrome'),
(36, 'Isosorbide Mononitrate (20mg)', 'other', '6373181264847', 214.20, 306.00, 176, '2027-03-28', 2, 'Prevention of Angina (heart-related chest pain)'),
(37, 'Insulin Lispro (25%) + Insulin Lispro Protamine (75%)', 'other', '8142590343745', 190.40, 272.00, 131, '2027-12-29', 1, ' Diabetes'),
(38, 'Pertuzumab (30mg/ml)', 'other', '3730607456054', 219.80, 314.00, 155, '2026-03-05', 2, ' Breast cancer'),
(39, 'Cefdinir (300mg)', 'other', '7211467885958', 39.90, 57.00, 163, '2027-12-05', 2, ' Bacterial infections'),
(40, 'Nepafenac (0.1% w/v)', 'other', '1021144499295', 83.30, 119.00, 118, '2028-04-30', 1, 'Treatment of Post-operative eye pain and inflammation'),
(41, 'Paracetamol (500mg)', 'other', '2270872816069', 249.90, 357.00, 74, '2027-12-07', 1, ' Pain reliefTreatment of Fever'),
(42, 'Lactitol (66.67% w/v)', 'other', '8105357261430', 125.30, 179.00, 65, '2027-05-02', 2, ' Constipation'),
(43, 'Trypsin Chymotrypsin (100000AU)', 'other', '5845744645852', 149.80, 214.00, 54, '2026-04-29', 1, ' Pain reliefTreatment of Swelling'),
(44, 'Ketoconazole (2% w/w)', 'other', '7867836115287', 25.90, 37.00, 66, '2027-02-16', 2, ' Fungal skin infections'),
(45, 'Pantoprazole (40mg) + Itopride (150mg)', 'other', '7695904362269', 269.50, 385.00, 194, '2026-07-19', 2, ' Gastroesophageal reflux disease (Acid reflux) Peptic ulcer disease'),
(46, 'Udenafil (100mg)', 'other', '7019221520392', 60.20, 86.00, 99, '2028-11-19', 1, 'Treatment of Erectile dysfunction'),
(47, 'Minoxidil (5% w/v)', 'other', '6240275210086', 265.30, 379.00, 108, '2026-07-18', 2, 'Treatment of Hair loss'),
(48, 'Nebivolol (5mg) + Telmisartan (40mg)', 'other', '8651350742521', 270.90, 387.00, 115, '2027-05-11', 1, ' Hypertension (high blood pressure)'),
(49, 'Lacosamide (100mg)', 'other', '5862148599822', 128.10, 183.00, 126, '2026-08-01', 1, ' Epilepsy/Seizures'),
(50, 'Fluoxetine (20mg) + Olanzapine (10mg)', 'other', '3819460543944', 214.90, 307.00, 165, '2027-05-18', 2, ' Bipolar depression'),
(51, 'Atorvastatin (80mg)', 'other', '1712071766863', 238.00, 340.00, 96, '2028-03-14', 1, ' High cholesterolPrevention of Heart attack'),
(52, 'Albendazole (400mg)', 'other', '6203299429434', 202.30, 289.00, 182, '2028-04-22', 1, 'Treatment of Parasitic infections'),
(53, 'Halobetasol (0.05% w/w) + Salicylic Acid (6% w/w)', 'other', '6036666673027', 186.20, 266.00, 180, '2027-12-16', 2, ' Eczema Psoriasis'),
(54, 'Emtricitabine (200mg) + Tenofovir disoproxil fumarate (300mg) + Efavirenz (600mg)', 'other', '2101347616375', 213.50, 305.00, 103, '2028-01-16', 1, ' HIV infection'),
(55, 'Cinnarizine (25mg)', 'other', '3845122270095', 131.60, 188.00, 88, '2028-06-11', 2, 'Treatment of Motion sicknessTreatment of VertigoTreatment of Meniere\'s disease'),
(56, 'Caroverine (20mg)', 'other', '6239938480713', 99.40, 142.00, 162, '2027-07-26', 2, ' Tinnitus (ringing in the ears)Treatment of Abdominal pain'),
(57, 'Doxycycline (100mg) + Lactobacillus (5Billion Spores)', 'other', '1839666753116', 268.10, 383.00, 77, '2027-05-10', 1, 'Treatment of Bacterial infections'),
(58, 'Itraconazole (200mg)', 'other', '4850537721998', 269.50, 385.00, 88, '2028-10-15', 1, 'Treatment of Fungal infections'),
(59, 'Iron (20mg)', 'other', '7854373836698', 19.60, 28.00, 187, '2026-07-26', 1, ' Iron deficiency anemia'),
(60, 'Benzoyl Peroxide (2.5% w/w)', 'other', '5398077818010', 245.70, 351.00, 102, '2028-12-30', 1, 'Treatment of Acne'),
(61, 'Clobetasol (0.05% w/w)', 'other', '2333811186451', 179.20, 256.00, 145, '2028-04-21', 1, 'Treatment of Allergic skin conditions'),
(62, 'Tranexamic Acid (500mg)', 'other', '1113516507284', 7.70, 11.00, 186, '2026-10-03', 1, 'Treatment of Bleeding'),
(63, 'Metformin  (500mg) +  Vildagliptin (50mg)', 'other', '9054847788657', 135.80, 194.00, 122, '2028-09-12', 1, 'Treatment of Type 2 diabetes mellitus'),
(64, 'Tenofovir disoproxil fumarate (300mg)', 'other', '5891252571894', 221.90, 317.00, 62, '2028-03-29', 2, 'Treatment of Chronic hepatitis B virus (HBV) infectionTreatment of HIV infection'),
(65, 'Trimetazidine (20mg)', 'other', '2741845829289', 232.40, 332.00, 181, '2027-07-23', 1, 'Treatment of Angina (heart-related chest pain)'),
(66, 'Ketoconazole (2% w/w)', 'other', '7391261239411', 16.80, 24.00, 86, '2028-10-02', 1, ' Fungal skin infections'),
(67, 'Ambroxol (75mg) + Levocetirizine (5mg) + Montelukast (10mg)', 'other', '4743866206530', 269.50, 385.00, 64, '2027-03-09', 1, 'Treatment of Respiratory tract disorders associated with viscid mucus'),
(68, 'Atorvastatin (10mg) + Fenofibrate (135mg)', 'other', '3226671915338', 95.20, 136.00, 184, '2026-01-17', 2, 'Treatment of High cholesterolPrevention of Heart attack'),
(69, 'Carboxymethylcellulose (0.5% w/v)', 'other', '3350062077653', 35.00, 50.00, 86, '2028-11-19', 1, 'Treatment of Dry eyes'),
(70, 'Cefpodoxime Proxetil (25mg)', 'other', '1554823966888', 110.60, 158.00, 106, '2027-10-18', 2, 'Treatment of Bacterial infections'),
(71, 'Acyclovir (5% w/w)', 'other', '9058565589039', 263.90, 377.00, 174, '2026-02-09', 1, ' Herpes labialis'),
(72, 'Formoterol (6mcg) + Budesonide (200mcg)', 'other', '5164425542291', 62.30, 89.00, 194, '2028-10-18', 1, 'Treatment of Chronic obstructive pulmonary disease (COPD)'),
(73, 'Etofylline (231mg) + Theophylline (69mg) + Salbutamol (4mg)', 'other', '5660985593657', 67.20, 96.00, 73, '2026-05-03', 2, 'Treatment of Asthma'),
(74, 'Metformin (500mg)', 'other', '8673886343840', 254.80, 364.00, 102, '2028-08-22', 1, 'Treatment of Type 2 diabetes mellitus'),
(75, 'Duloxetine (20mg)', 'other', '3478498173274', 154.00, 220.00, 159, '2028-12-28', 2, 'Treatment of DepressionTreatment of Anxiety disorderTreatment of Diabetic nerve painTreatment of FibromyalgiaTreatment of Neuropathic painTreatment of Stress urinary incontinence'),
(76, 'Arteether (150mg)', 'other', '4860726173893', 74.90, 107.00, 151, '2027-11-10', 1, ' Malaria'),
(77, 'Dill Oil (0.005ml) + Fennel Oil (0.0007ml) + Simethicone (40mg)', 'other', '5839962171757', 215.60, 308.00, 140, '2027-10-26', 2, 'Treatment of Abdominal pain'),
(78, 'Olanzapine (2.5mg)', 'other', '9739264270833', 140.70, 201.00, 154, '2028-07-04', 2, 'Treatment of SchizophreniaTreatment of Mania'),
(79, 'Silver Colloid (10ppm)', 'other', '1824826517292', 44.10, 63.00, 141, '2026-08-08', 2, 'Prevention of Wound infection'),
(80, 'Mometasone (0.1% w/w) + Fusidic Acid (2% w/w)', 'other', '9970868921253', 204.40, 292.00, 71, '2026-03-21', 2, 'Treatment of Skin conditions with inflammation & itching'),
(81, 'Azithromycin (500mg)', 'other', '9616075156285', 253.40, 362.00, 71, '2026-05-18', 1, 'Treatment of Bacterial infections'),
(82, 'Levetiracetam (100mg/ml)', 'other', '6316058399074', 254.80, 364.00, 96, '2027-01-06', 2, 'Treatment of Epilepsy/Seizures'),
(83, 'Ambroxol (15mg/5ml) + Pseudoephedrine (30mg/5ml) + Chlorpheniramine Maleate (2mg/5ml)', 'other', '7678562739763', 161.00, 230.00, 91, '2026-11-30', 2, ' Common cold'),
(84, 'Pregabalin (75mg) + Nortriptyline (10mg)', 'other', '9093799190493', 180.60, 258.00, 74, '2028-12-29', 2, 'Treatment of Neuropathic pain'),
(85, 'Etoricoxib (60mg) + Thiocolchicoside (4mg)', 'other', '4982389928507', 258.30, 369.00, 78, '2027-06-13', 2, 'Treatment of Pain due to muscle spasm'),
(86, 'Repaglinide (0.5mg)', 'other', '3661513503072', 149.80, 214.00, 172, '2026-01-06', 2, 'Treatment of Type 2 diabetes mellitus'),
(87, 'Losartan (50mg)', 'other', '1895437312606', 226.10, 323.00, 76, '2028-02-12', 1, 'Treatment of Hypertension (high blood pressure)Treatment of Heart failure Prevention of heart attack and stroke'),
(88, 'Nortriptyline (50mg)', 'other', '4066375306752', 115.50, 165.00, 122, '2026-01-28', 1, ' Depression Bed-wetting Neuropathic pain'),
(89, 'Propranolol (20mg)', 'other', '2400267849350', 151.20, 216.00, 136, '2026-01-28', 2, 'Treatment of PheochromocytomaTreatment of Hypertension (high blood pressure) Prevention of migraineTreatment of AnxietyTreatment of ArrhythmiaPrevention of Heart attackPrevention of Angina (heart-related chest pain)Treatment of Tremors'),
(90, 'Ketoconazole (2% w/v) + Coal Tar (4% w/v)', 'other', '6599150955155', 79.10, 113.00, 111, '2027-07-22', 2, 'Treatment of Dandruff'),
(91, 'Fenofibrate (160mg) + Rosuvastatin (10mg)', 'other', '2811044288531', 164.50, 235.00, 172, '2028-11-07', 1, 'Treatment of High cholesterolPrevention of Heart attack'),
(92, 'Acebrophylline (100mg) + Acetylcysteine (600mg)', 'other', '9275246358692', 83.30, 119.00, 115, '2027-10-03', 2, 'Treatment of Chronic obstructive pulmonary disease (COPD)'),
(93, 'Carbamazepine (300mg)', 'other', '8777699672501', 146.30, 209.00, 105, '2028-12-07', 1, ' Epilepsy/Seizures Trigeminal neuralgia Diabetic nerve pain'),
(94, 'Silymarin (140mg)', 'other', '4343073858726', 15.40, 22.00, 54, '2028-08-29', 1, ' Chronic liver disease Liver cirrhosis'),
(95, 'Betahistine (16mg)', 'other', '9181024980139', 28.70, 41.00, 66, '2028-03-07', 1, 'Treatment of Meniere\'s disease'),
(96, 'Ketoprofen (100mg) + Thiocolchicoside (8mg)', 'other', '4559643104876', 17.50, 25.00, 182, '2026-03-25', 1, ' Pain due to muscle spasm'),
(97, 'Ibandronic Acid (150mg)', 'other', '4737226665495', 242.20, 346.00, 134, '2028-05-16', 1, 'Treatment and prevention of postmenopausal Osteoporosis'),
(98, 'Fenofibrate (160mg) + Rosuvastatin (10mg)', 'other', '1508949618584', 138.60, 198.00, 179, '2026-06-12', 1, 'Treatment of High cholesterolPrevention of Heart attack'),
(99, 'Fenofibrate (160mg) + Rosuvastatin (5mg)', 'other', '9676239726608', 216.30, 309.00, 72, '2027-02-27', 2, 'Treatment of High cholesterolPrevention of Heart attack'),
(100, 'Lamivudine (300mg) + Tenofovir disoproxil fumarate (300mg) + Efavirenz (400mg)', 'other', '1185056598060', 172.90, 247.00, 180, '2028-06-08', 1, 'Treatment of HIV infection'),
(101, 'Testosterone Propionate (30mg) + Testosterone Phenylpropionate (60mg) + Testosterone Isocaproate (60mg) + Testosterone Decanoate (100mg)', 'other', '3378437217931', 9.80, 14.00, 170, '2028-01-10', 2, 'Treatment of Male hypogonadism'),
(102, 'Itraconazole (200mg)', 'other', '3313376836571', 64.40, 92.00, 112, '2027-06-27', 1, 'Treatment of Fungal infections'),
(103, 'Levosalbutamol (1.25mg) + Ipratropium (500mcg)', 'other', '8602458536992', 147.70, 211.00, 52, '2027-05-27', 2, 'Treatment of Chronic obstructive pulmonary disease (COPD)'),
(104, 'Azithromycin (1% w/v)', 'other', '4603170934475', 289.10, 413.00, 93, '2026-08-30', 1, 'Treatment of Bacterial eye infections'),
(105, 'Ursodeoxycholic Acid (300mg)', 'other', '7681860271798', 56.70, 81.00, 157, '2027-12-03', 2, 'Treatment of Primary biliary cirrhosisTreatment of Gallbladder stones'),
(106, 'Calcium citrate (1000mg) + Vitamin D3 (1000IU) + Zinc Sulfate (7.5mg) + Magnesium Sulphate (20mg)', 'other', '8734807525070', 182.00, 260.00, 170, '2026-07-21', 1, ' Nutritional deficiencies'),
(107, 'Nicorandil (10mg)', 'other', '8353019076385', 259.70, 371.00, 183, '2028-03-01', 1, 'Treatment of Angina (heart-related chest pain)'),
(108, 'Ursodeoxycholic Acid (125mg/5ml)', 'other', '3715823544628', 13.30, 19.00, 82, '2028-10-07', 1, 'Treatment of Primary biliary cirrhosisTreatment of Gallbladder stones'),
(109, 'Ketoconazole (2% w/w) + Zinc pyrithione (1% w/w)', 'other', '4961217273482', 203.70, 291.00, 161, '2027-07-27', 1, 'Treatment of Fungal skin infectionsTreatment of Dandruff'),
(110, 'Haloperidol (20mg)', 'other', '4070717230687', 6.30, 9.00, 98, '2028-02-02', 2, ' Schizophrenia'),
(111, 'Tranexamic Acid (10% w/w) + Kojic Acid (2% w/w) + Arbutin (1.5% w/w) + Magnesium (1% w/w) + Vitamin E (1% w/w) + Mulberry extract (1% w/w)', 'other', '3363302342047', 228.20, 326.00, 147, '2026-12-02', 1, ' Melasma'),
(112, 'Paroxetine (12.5mg)', 'other', '2476292543477', 179.20, 256.00, 140, '2028-09-08', 1, 'Treatment of DepressionTreatment of Panic disorderTreatment of Anxiety disorder'),
(113, 'Hydroquinone (2% w/w) + Mometasone (0.1% w/w) + Tretinoin (0.025% w/w)', 'other', '2067546282716', 198.10, 283.00, 142, '2028-04-07', 1, 'Treatment of Melasma'),
(114, 'Diacerein (50mg) + Glucosamine (1500mg)', 'other', '4952632456365', 256.20, 366.00, 107, '2027-07-31', 2, ' Osteoarthritis'),
(115, 'Telmisartan (40mg) + Hydrochlorothiazide (12.5mg)', 'other', '9806459398257', 29.40, 42.00, 148, '2028-02-03', 2, 'Treatment of Hypertension (high blood pressure)'),
(116, 'Hydroquinone (2% w/w) + Tretinoin (0.025% w/w) + Fluocinolone acetonide (0.01% w/w)', 'other', '3975877035353', 193.90, 277.00, 184, '2026-05-25', 1, ' Melasma'),
(117, 'Aceclofenac (100mg) + Paracetamol (325mg)', 'other', '3911512508110', 193.20, 276.00, 133, '2026-08-21', 2, ' Pain relief'),
(118, 'Climbazole (1% w/w) + Piroctone Olamine (0.5% w/w)', 'other', '8813579758441', 231.70, 331.00, 163, '2027-09-07', 1, 'Treatment of Dandruff'),
(119, 'Albendazole (400mg)', 'other', '5319557153567', 71.40, 102.00, 55, '2026-08-16', 2, 'Treatment of Parasitic infections'),
(120, 'Moxifloxacin (0.5% w/v) + Dexamethasone (0.1% w/v)', 'other', '9211771623013', 13.30, 19.00, 125, '2027-01-18', 2, 'Treatment of Bacterial eye infections'),
(121, 'Paroxetine (25mg)', 'other', '3463618426006', 142.80, 204.00, 107, '2028-09-04', 2, 'Treatment of DepressionTreatment of Panic disorderTreatment of Anxiety disorder'),
(122, 'Fexofenadine (180mg)', 'other', '3504778351220', 286.30, 409.00, 186, '2027-02-04', 1, 'Treatment of Sneezing and runny nose due to allergiesTreatment of Allergic conditions'),
(123, 'Olmesartan Medoxomil (20mg) + Metoprolol Succinate (25mg)', 'other', '8276802725847', 55.30, 79.00, 166, '2028-04-28', 2, ' Hypertension (high blood pressure)'),
(124, 'Omeprazole (20mg)', 'other', '4187634356613', 82.60, 118.00, 194, '2026-09-07', 2, 'Treatment of HeartburnTreatment of Gastroesophageal reflux disease (Acid reflux)Treatment of Peptic ulcer diseaseTreatment of Zollinger-Ellison syndrome'),
(125, 'Amoxycillin  (200mg) +  Clavulanic Acid (28.5mg)', 'other', '9342502672166', 142.80, 204.00, 186, '2028-12-22', 1, 'Treatment of Resistance Tuberculosis (TB)Treatment of Bacterial infections'),
(126, 'Itraconazole (100mg)', 'other', '8460303834157', 198.80, 284.00, 160, '2027-05-08', 2, 'Treatment of Fungal infections'),
(127, 'Formoterol (6mcg) + Budesonide (200mcg)', 'other', '3609137681936', 91.00, 130.00, 113, '2026-03-12', 2, 'Treatment of Chronic obstructive pulmonary disease (COPD)'),
(128, 'Glimepiride (1mg) + Metformin (500mg) + Pioglitazone (15mg)', 'other', '4497530019753', 230.30, 329.00, 191, '2027-06-05', 2, 'Treatment of Type 2 diabetes mellitus'),
(129, 'Amlodipine (5mg) + Lisinopril (5mg)', 'other', '2350823386291', 210.00, 300.00, 114, '2028-02-03', 1, ' Hypertension (high blood pressure)'),
(130, 'Minoxidil (5% w/v)', 'other', '9959781681762', 21.70, 31.00, 51, '2026-11-02', 2, 'Treatment of Hair loss'),
(131, 'Amoxycillin  (250mg) +  Clavulanic Acid (125mg)', 'other', '4937176805924', 44.10, 63.00, 121, '2027-06-30', 2, 'Treatment of Bacterial infections'),
(132, 'Amiodarone (200mg)', 'other', '9017002607914', 102.20, 146.00, 142, '2028-03-28', 2, 'Treatment of Arrhythmia'),
(133, 'Insulin Lispro (50%) + Insulin Lispro Protamine (50%)', 'other', '8183901337467', 141.40, 202.00, 133, '2026-04-08', 1, ' Diabetes'),
(134, 'Sucralfate (1gm/5ml) + Oxetacaine (10mg/5ml)', 'other', '2304217018934', 160.30, 229.00, 76, '2026-04-01', 2, 'Treatment of AcidityTreatment of HeartburnTreatment of Stomach ulcers'),
(135, 'Terbinafine (1% w/w)', 'other', '1296028784213', 272.30, 389.00, 181, '2028-11-14', 1, ' Fungal skin infections'),
(136, 'Trypsin (50000AU) + Rutoside (100mg) + Bromelain (90mg) + Aceclofenac (100mg)', 'other', '4165827072559', 257.60, 368.00, 91, '2027-09-21', 1, ' Pain relief'),
(137, 'Beclometasone (0.05% w/v)', 'other', '1245162241065', 278.60, 398.00, 136, '2027-01-09', 1, ' Skin conditions with inflammation & itchingTreatment of Asthma'),
(138, 'Moxifloxacin (400mg)', 'other', '8153580211078', 266.70, 381.00, 61, '2026-09-23', 1, 'Treatment of Bacterial eye infections'),
(139, 'Etoricoxib (60mg)', 'other', '2977871884644', 102.90, 147.00, 122, '2027-05-03', 1, ' Pain relief'),
(140, 'Hyoscyamine (0.125mg)', 'other', '4338166460898', 184.10, 263.00, 150, '2027-05-29', 2, 'Treatment of Peptic ulcer diseaseTreatment of Irritable bowel syndrome Pain relief'),
(141, 'Carbamazepine (200mg)', 'other', '9047256564593', 247.10, 353.00, 77, '2028-06-05', 1, ' Epilepsy/Seizures Trigeminal neuralgia Diabetic nerve pain'),
(142, 'Etofylline (50mg) + Salbutamol (1mg)', 'other', '6694181031294', 185.50, 265.00, 161, '2026-09-20', 1, 'Treatment of Asthma'),
(143, 'Tetanus Toxoid (40IU)', 'other', '3145543785237', 175.70, 251.00, 174, '2028-11-17', 1, 'Prevention of Tetanus'),
(144, 'Aspirin (75mg) + Rosuvastatin (10mg) + Clopidogrel (75mg)', 'other', '7616196640636', 240.10, 343.00, 63, '2027-05-24', 1, ' Heart attack'),
(145, 'Ambroxol (75mg) + Levocetirizine (5mg) + Montelukast (10mg)', 'other', '5832345903745', 11.20, 16.00, 88, '2028-01-03', 1, 'Treatment of Respiratory tract disorders associated with viscid mucus'),
(146, 'Isosorbide Dinitrate (20mg) + Hydralazine (37.5mg)', 'other', '9320218283652', 121.10, 173.00, 180, '2028-08-04', 1, 'Treatment of Heart failure'),
(147, 'Lacosamide (200mg)', 'other', '4357688628671', 74.90, 107.00, 123, '2026-07-27', 1, ' Epilepsy/Seizures'),
(148, 'Glimepiride (2mg)', 'other', '3543278928620', 165.90, 237.00, 152, '2027-04-23', 2, 'Treatment of Type 2 diabetes mellitus'),
(149, 'Paroxetine (20mg)', 'other', '6807315837184', 52.50, 75.00, 95, '2028-09-20', 1, 'Treatment of DepressionTreatment of Panic disorderTreatment of Anxiety disorder'),
(150, 'Gliclazide (60mg)', 'other', '1993649332550', 277.20, 396.00, 147, '2027-12-26', 1, 'Treatment of Type 2 diabetes mellitus'),
(151, 'Aceclofenac (100mg) + Paracetamol (325mg)', 'other', '9906465956309', 60.20, 86.00, 139, '2027-06-18', 2, ' Pain relief'),
(152, 'Rabies vaccine, Human (2.5IU)', 'other', '4651225563374', 163.10, 233.00, 166, '2027-07-19', 2, ' Prevention of Rabies'),
(153, 'Pancreatin (170mg)', 'other', '8449167234268', 202.30, 289.00, 99, '2027-04-22', 1, 'Treatment of Pancreatic enzyme deficiency'),
(154, 'Fluconazole (200mg)', 'other', '3504671030605', 213.50, 305.00, 60, '2026-06-30', 1, 'Treatment of Fungal infections'),
(155, 'Levetiracetam (500mg)', 'other', '6798524207266', 219.80, 314.00, 200, '2026-10-20', 2, 'Treatment of Epilepsy/Seizures'),
(156, 'Dextromethorphan Hydrobromide (15mg/5ml)', 'other', '5814546185238', 158.20, 226.00, 76, '2027-12-30', 1, ' Dry cough'),
(157, 'Glimepiride (2mg) + Metformin (500mg)', 'other', '5422226925810', 84.00, 120.00, 116, '2027-01-04', 1, 'Treatment of Type 2 diabetes mellitus'),
(158, 'Tadalafil (5mg)', 'other', '7401941373679', 169.40, 242.00, 190, '2026-10-05', 2, 'Treatment of Erectile dysfunction'),
(159, 'Glimepiride (2mg) + Metformin (1000mg) + Voglibose (0.3mg)', 'other', '5426239869490', 162.40, 232.00, 122, '2026-10-07', 2, 'Treatment of Type 2 diabetes mellitus'),
(160, 'Atorvastatin (5mg)', 'other', '7305553616537', 107.10, 153.00, 60, '2028-11-25', 1, ' High cholesterolPrevention of Heart attack'),
(161, 'Atorvastatin (10mg) + Fenofibrate (160mg)', 'other', '3599419870112', 278.60, 398.00, 85, '2027-10-15', 1, 'Treatment of High cholesterolPrevention of Heart attack'),
(162, 'Pregabalin (75mg)', 'other', '9895407552627', 5.60, 8.00, 120, '2028-09-29', 1, 'Treatment of Neuropathic painTreatment of Epilepsy/SeizuresTreatment of Fibromyalgia'),
(163, 'Voglibose (0.3mg)', 'other', '1017217867830', 191.10, 273.00, 134, '2027-06-13', 1, 'Treatment of Type 2 diabetes mellitus'),
(164, 'Salbutamol (2.5mg)', 'other', '7751195241952', 43.40, 62.00, 97, '2028-10-26', 1, 'Treatment of Chronic obstructive pulmonary disease (COPD)Treatment and prevention of Asthma'),
(165, 'Domperidone (30mg) + Rabeprazole (20mg)', 'other', '4171315839992', 227.50, 325.00, 63, '2028-01-25', 1, 'Treatment of Gastroesophageal reflux disease (Acid reflux)Treatment of Peptic ulcer disease'),
(166, 'Trimetazidine (60mg)', 'other', '4089017148304', 283.50, 405.00, 66, '2028-12-29', 2, 'Treatment of Angina (heart-related chest pain)'),
(167, 'Metoprolol Succinate (95mg)', 'other', '5753525730948', 174.30, 249.00, 56, '2026-06-17', 2, 'Treatment of Hypertension (high blood pressure)Treatment of Angina (heart-related chest pain)Treatment of ArrhythmiaPrevention of Heart attackPrevention of Migraine'),
(168, 'Methotrexate (1% w/w)', 'other', '3445239530382', 77.00, 110.00, 109, '2028-10-21', 2, 'Treatment of Psoriasis'),
(169, 'Moxifloxacin (0.5% w/v)', 'other', '6895561667045', 68.60, 98.00, 61, '2028-07-10', 1, 'Treatment of Bacterial eye infections'),
(170, 'Levosulpiride (75mg) + Rabeprazole (20mg)', 'other', '9268248039093', 255.50, 365.00, 124, '2026-07-25', 1, 'Treatment of Gastroesophageal reflux disease (Acid reflux)Treatment of Intestinal ulcersTreatment of Irritable bowel syndrome'),
(171, 'Itraconazole (100mg)', 'other', '2403982457837', 109.20, 156.00, 132, '2026-10-30', 1, 'Treatment of Fungal infections'),
(172, 'Diclofenac (75mg)', 'other', '8066687873892', 293.30, 419.00, 143, '2027-12-24', 2, ' Pain relief'),
(173, 'Tacrolimus (0.03% w/w)', 'other', '6256218665279', 126.70, 181.00, 130, '2027-02-12', 2, 'Treatment of Atopic dermatitis'),
(174, 'Serratiopeptidase (10mg)', 'other', '2323756841765', 102.90, 147.00, 136, '2028-10-21', 2, ' Pain relief Swelling'),
(175, 'Pregabalin (75mg) + Nortriptyline (10mg)', 'other', '7238021130896', 186.20, 266.00, 175, '2028-08-12', 2, 'Treatment of Neuropathic pain'),
(176, 'Metronidazole (2% w/w)', 'other', '2079362261727', 76.30, 109.00, 101, '2028-01-06', 2, ' AcneTreatment of Bacterial infectionsTreatment of Parasitic infections'),
(177, 'Bisoprolol (5mg)', 'other', '4407790406559', 31.50, 45.00, 132, '2026-05-15', 1, 'Treatment of Hypertension (high blood pressure)Treatment of Angina (heart-related chest pain)Treatment of ArrhythmiaPrevention of Heart attackPrevention of Migraine'),
(178, 'Sertaconazole (2% w/v) + Zinc pyrithione (1% w/v)', 'other', '2205712396322', 190.40, 272.00, 159, '2026-02-07', 2, 'Treatment of Dandruff'),
(179, 'L-Ornithine L-Aspartate (3gm)', 'other', '6811455779300', 98.00, 140.00, 126, '2027-09-20', 1, 'Treatment of Liver  disease'),
(180, 'Glimepiride (2mg) + Metformin (850mg)', 'other', '9607849308750', 223.30, 319.00, 170, '2028-05-07', 1, 'Treatment of Type 2 diabetes mellitus'),
(181, 'Orlistat (120mg)', 'other', '5613321970000', 128.10, 183.00, 53, '2026-11-15', 2, ' Obesity'),
(182, 'Povidone Iodine (5% w/w) + Tinidazole (1% w/w) + Sucralfate (7% w/w)', 'other', '7807707067174', 237.30, 339.00, 97, '2026-10-31', 2, ' Bacterial skin infections'),
(183, 'Timolol (5mg/ml) + Latanoprost (50mcg/ml)', 'other', '3327826612051', 69.30, 99.00, 185, '2028-04-18', 1, 'Treatment of GlaucomaTreatment of Ocular hypertension'),
(184, 'Glimepiride (1mg) + Metformin (500mg) + Pioglitazone (15mg)', 'other', '7489444148832', 154.70, 221.00, 58, '2026-08-16', 2, 'Treatment of Type 2 diabetes mellitus'),
(185, 'Haloperidol (0.25mg)', 'other', '8759220540446', 269.50, 385.00, 131, '2026-01-10', 1, ' Schizophrenia'),
(186, 'Atorvastatin (10mg) + Fenofibrate (160mg)', 'other', '6597854068581', 245.70, 351.00, 146, '2028-03-14', 1, 'Treatment of High cholesterolPrevention of Heart attack'),
(187, 'Pregabalin (75mg) + Nortriptyline (10mg)', 'other', '9059965221469', 225.40, 322.00, 88, '2026-04-12', 2, 'Treatment of Neuropathic pain'),
(188, 'Tretinoin (0.1% w/w)', 'other', '6687734867345', 203.70, 291.00, 122, '2028-04-24', 1, 'Treatment of Acne Acute promyelocytic leukaemia'),
(189, 'Indacaterol (110mcg) + Glycopyrrolate (50mcg)', 'other', '3221157225694', 82.60, 118.00, 128, '2027-11-13', 1, ' Chronic obstructive pulmonary disease (COPD)'),
(190, 'Fenofibrate (160mg)', 'other', '5481918739355', 277.20, 396.00, 141, '2028-03-02', 1, ' High cholesterol'),
(191, 'Gefitinib (250mg)', 'other', '8461659405765', 179.20, 256.00, 186, '2027-09-22', 1, ' Non-small cell lung cancer'),
(192, 'Indomethacin (25mg)', 'other', '6834297886696', 16.80, 24.00, 85, '2026-12-03', 1, ' Pain relief'),
(193, 'Roxithromycin (150mg) + Ambroxol (60mg)', 'other', '4874503740122', 172.90, 247.00, 82, '2028-08-24', 2, ' Respiratory tract infection'),
(194, 'Bambuterol (10mg) + Montelukast (10mg)', 'other', '2359262096239', 174.30, 249.00, 69, '2027-03-19', 1, 'Treatment of Asthma'),
(195, 'Atorvastatin (10mg)', 'other', '2087083041738', 5.60, 8.00, 145, '2028-02-08', 1, ' High cholesterolPrevention of Heart attack'),
(196, 'Myo-Inositol (550mg) + D-Chiro Inositol (13.8mg) + Metformin (500mg) + L-Methyl Folate Calcium (0.5mg) + Methylcobalamin (750mcg)', 'other', '7006941409172', 75.60, 108.00, 68, '2028-01-10', 2, ' Polycystic ovarian syndrome (PCOS)'),
(197, 'Thyroxine (12.5mcg)', 'other', '8771411932350', 25.90, 37.00, 168, '2028-07-23', 2, 'Treatment of Hypothyroidism'),
(198, 'Medroxyprogesterone acetate (10mg)', 'other', '7279048383765', 122.50, 175.00, 96, '2027-06-19', 2, 'Treatment of AmenorrheaTreatment of Abnormal uterine bleedingTreatment of Endometriosis'),
(199, 'Obeticholic acid (10mg)', 'other', '2781231279915', 293.30, 419.00, 150, '2026-12-15', 1, 'Treatment of Primary biliary cirrhosis'),
(200, 'S-Metoprolol Succinate (23.75mg)', 'other', '5982153273202', 150.50, 215.00, 101, '2028-10-28', 2, 'Treatment of Hypertension (high blood pressure)Treatment of Angina (heart-related chest pain)Treatment of ArrhythmiaPrevention of Heart attackPrevention of StrokePrevention of Migraine'),
(201, 'Cetirizine (10mg/ml)', 'other', '1422570340271', 39.90, 57.00, 77, '2028-10-10', 2, 'Treatment of Allergic conditions'),
(202, 'Clomiphene (50mg) + Coenzyme Q10 (50mg)', 'other', '8760019604459', 198.10, 283.00, 67, '2026-09-20', 1, ' Female infertility'),
(203, 'Thiocolchicoside (4mg) + Aceclofenac (100mg) + Paracetamol (325mg)', 'other', '6749572548250', 100.80, 144.00, 127, '2027-08-01', 1, 'Treatment of Muscular pain'),
(204, 'Methotrexate (25mg)', 'other', '3643631473631', 111.30, 159.00, 71, '2027-01-16', 1, 'Treatment of Rheumatoid arthritisTreatment of PsoriasisTreatment of CancerTreatment of Crohn’s disease'),
(205, 'Metoprolol Tartrate (25mg)', 'other', '9444728969846', 127.40, 182.00, 163, '2028-01-14', 1, 'Treatment of Hypertension (high blood pressure)Treatment of Angina (heart-related chest pain)Treatment of ArrhythmiaPrevention of Heart attackPrevention of Migraine'),
(206, 'Ofloxacin (200mg)', 'other', '8101283497141', 11.90, 17.00, 157, '2028-12-25', 2, 'Treatment of Bacterial infections'),
(207, 'Ampicillin (500mg) + Dicloxacillin (500mg)', 'other', '5262844548641', 296.80, 424.00, 162, '2027-07-10', 2, 'Treatment of Bacterial infections'),
(208, 'Levetiracetam (1000mg)', 'other', '2950691552970', 169.40, 242.00, 57, '2026-08-29', 1, 'Treatment of Epilepsy/Seizures'),
(209, 'Pirfenidone (200mg)', 'other', '6040324099842', 112.70, 161.00, 168, '2028-08-11', 1, 'Treatment of Idiopathic pulmonary fibrosis'),
(210, 'Gliclazide (80mg)', 'other', '2078049150768', 149.10, 213.00, 170, '2027-05-05', 2, 'Treatment of Type 2 diabetes mellitus'),
(211, 'Risperidone (4mg) + Trihexyphenidyl (2mg)', 'other', '6575892858201', 133.70, 191.00, 57, '2028-05-22', 2, ' Schizophrenia'),
(212, 'Fluconazole (0.3% w/v)', 'other', '9173317609059', 154.70, 221.00, 188, '2026-01-15', 1, ' Ear infectionTreatment of Fungal infections'),
(213, 'Pantoprazole (40mg)', 'other', '5170150623745', 182.70, 261.00, 50, '2027-07-07', 1, 'Treatment of HeartburnTreatment of Gastroesophageal reflux disease (Acid reflux)Treatment of Peptic ulcer diseaseTreatment of Zollinger-Ellison syndrome'),
(214, 'Azathioprine (50mg)', 'other', '2973547648775', 79.80, 114.00, 76, '2028-03-22', 2, ' Prevention of organ rejection in transplant patientsTreatment of Rheumatoid arthritis'),
(215, 'Halobetasol (0.05% w/v)', 'other', '9766321425452', 291.90, 417.00, 52, '2028-06-14', 2, ' Skin conditions with inflammation & itching'),
(216, 'Lecithin (1250mg) + Methylcobalamin (1500mcg) + Pregabalin (75mg) + Biotin (5mg)', 'other', '2050289406313', 134.40, 192.00, 51, '2026-06-28', 1, ' Neuropathic pain'),
(217, 'Minoxidil (5% w/v)', 'other', '2387504399453', 186.90, 267.00, 85, '2028-02-08', 2, 'Treatment of Hair loss'),
(218, 'Olmesartan Medoxomil (20mg) + Amlodipine (5mg) + Hydrochlorothiazide (12.5mg)', 'other', '1237337144676', 174.30, 249.00, 160, '2028-02-19', 1, ' Hypertension (high blood pressure)'),
(219, 'Telmisartan (40mg) + Hydrochlorothiazide (12.5mg)', 'other', '1612803892883', 114.80, 164.00, 74, '2026-04-21', 1, 'Treatment of Hypertension (high blood pressure)'),
(220, 'Fluconazole (200mg)', 'other', '2411234104811', 28.00, 40.00, 134, '2026-01-05', 2, 'Treatment of Fungal infections'),
(221, 'Timolol (0.5% w/v) + Brimonidine (0.2% w/v)', 'other', '8269208672245', 137.90, 197.00, 123, '2026-03-01', 2, 'Treatment of Ocular hypertensionTreatment of Glaucoma'),
(222, 'Montelukast (10mg)', 'other', '5736360054985', 114.80, 164.00, 131, '2026-04-08', 2, 'Prevention of Asthma'),
(223, 'Prucalopride (1mg)', 'other', '3347287499709', 259.00, 370.00, 190, '2026-08-08', 1, 'Treatment of Constipation'),
(224, 'Troxipide (100mg)', 'other', '5771912212694', 110.60, 158.00, 78, '2028-11-27', 1, ' Stomach ulcers'),
(225, 'Glucosamine (750mg) + Diacerein (50mg) + Methyl Sulfonyl Methane (250mg)', 'other', '7262510583726', 247.10, 353.00, 56, '2026-07-25', 1, ' Osteoarthritis'),
(226, 'Sumatriptan (85mg) + Naproxen (500mg)', 'other', '1887993303597', 259.70, 371.00, 128, '2027-06-08', 2, 'Treatment of Migraine'),
(227, 'Metformin (500mg)', 'other', '4266555450278', 179.90, 257.00, 123, '2026-12-14', 2, 'Treatment of Type 2 diabetes mellitus'),
(228, 'Doxylamine (20mg) + Vitamin B6 (Pyridoxine) (20mg)', 'other', '1670938685847', 207.20, 296.00, 95, '2028-01-15', 1, 'Treatment of Nausea and vomiting in pregnancy'),
(229, 'Aceclofenac (100mg) + Thiocolchicoside (4mg)', 'other', '1778864226110', 95.20, 136.00, 111, '2027-04-21', 1, 'Treatment of Pain due to muscle spasm'),
(230, 'Desvenlafaxine (100mg)', 'other', '8791433884711', 233.80, 334.00, 119, '2028-06-29', 2, ' Depression'),
(231, 'Glipizide (2.5mg)', 'other', '6342094416896', 79.80, 114.00, 91, '2028-04-01', 2, 'Treatment of Type 2 diabetes mellitus'),
(232, 'Mosapride (5mg)', 'other', '3763313367285', 184.10, 263.00, 160, '2026-09-25', 2, ' Gastroesophageal reflux disease (Acid reflux)'),
(233, 'Levo-carnitine (330mg)', 'other', '4189352073109', 188.30, 269.00, 166, '2027-04-07', 2, ' Carnitine deficiency'),
(234, 'Gabapentin (100mg) + Nortriptyline (10mg)', 'other', '7492424148898', 205.10, 293.00, 127, '2028-08-06', 1, 'Treatment of Neuropathic pain'),
(235, 'Amorolfine (0.25% w/w) + Phenoxyethanol (1% w/w)', 'other', '2994871960211', 263.20, 376.00, 125, '2028-12-31', 2, 'Treatment of Fungal infections'),
(236, 'Artemether (80mg) + Lumefantrine (480mg)', 'other', '4164207929789', 144.20, 206.00, 192, '2026-06-08', 1, 'Treatment of Malaria'),
(237, 'Minoxidil (2% w/v)', 'other', '1184694154106', 231.00, 330.00, 197, '2026-08-19', 1, 'Treatment of Hair loss'),
(238, 'Hydrocortisone (100mg)', 'other', '7112113825358', 228.20, 326.00, 53, '2027-10-18', 2, ' Severe allergic reactionsTreatment of Allergic conditionsTreatment of CancerTreatment of Skin disordersTreatment of Eye disorders'),
(239, 'Sertraline (100mg)', 'other', '9579437582191', 9.80, 14.00, 124, '2026-01-18', 1, 'Treatment of DepressionTreatment of Post traumatic stress disorderTreatment of Obsessive-compulsive disorderTreatment of Panic disorderTreatment of Premenstrual dysphoric disorderTreatment of AnxietyTreatment of Premenstrual syndrome (PMS)'),
(240, 'Insulin Isophane/NPH   (70%) +   Human Insulin/Soluble Insulin (30%)', 'other', '2517566625850', 207.90, 297.00, 81, '2026-09-28', 2, ' Diabetes'),
(241, 'Gabapentin (300mg)', 'other', '5227876710651', 81.90, 117.00, 88, '2028-01-14', 1, 'Treatment of Neuropathic painTreatment of Epilepsy/Seizures'),
(242, 'Carboxymethylcellulose (0.5% w/v)', 'other', '6441403253578', 162.40, 232.00, 67, '2027-06-04', 1, 'Treatment of Dry eyes'),
(243, 'Nepafenac (0.3% w/v)', 'other', '2211136148292', 98.70, 141.00, 181, '2026-06-16', 1, 'Treatment of Post-operative eye pain and inflammation'),
(244, 'Beclometasone (0.025% w/w) + Fusidic Acid (2% w/w)', 'other', '7088592598919', 214.20, 306.00, 125, '2028-05-17', 1, ' Skin infections'),
(245, 'Divalproex (125mg)', 'other', '7881917445417', 217.70, 311.00, 119, '2026-11-29', 2, 'Treatment of Epilepsy/SeizuresTreatment of Bipolar disorderPrevention of Migraine'),
(246, 'Domperidone (30mg) + Esomeprazole (40mg)', 'other', '4796681002466', 7.70, 11.00, 112, '2027-02-08', 2, 'Treatment of Gastroesophageal reflux disease (Acid reflux)Treatment of Functional dyspepsia'),
(247, 'Chlorpheniramine Maleate (4mg) + Phenylephrine (10mg)', 'other', '5913485941134', 56.00, 80.00, 131, '2027-01-02', 2, 'Treatment of Common cold'),
(248, 'Linezolid (100mg/5ml)', 'other', '2467799292715', 109.20, 156.00, 53, '2026-10-04', 1, 'Treatment of Resistant Tuberculosis (TB)Treatment of Severe bacterial infections'),
(249, 'Escitalopram Oxalate (5mg)', 'other', '9562210631857', 177.80, 254.00, 182, '2028-01-10', 2, 'Treatment of DepressionTreatment of Anxiety disorderTreatment of Panic disorder'),
(250, 'Human insulin (100IU)', 'other', '9040243380345', 119.70, 171.00, 64, '2027-12-16', 1, ' Diabetes'),
(251, 'Etoricoxib (60mg)', 'other', '9565622893303', 190.40, 272.00, 83, '2028-09-26', 1, ' Pain relief'),
(252, 'Ofloxacin (200mg) + Flavoxate (200mg)', 'other', '3823944785237', 75.60, 108.00, 114, '2028-12-25', 1, 'Treatment of Urinary tract infections (UTIs)'),
(253, 'Glimepiride (2mg) + Metformin (500mg) + Pioglitazone (15mg)', 'other', '9137724953226', 134.40, 192.00, 59, '2028-10-30', 1, 'Treatment of Type 2 diabetes mellitus');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_19_151348_create_suppliers_table', 1),
(5, '2025_08_19_151501_create_medicines_table', 1),
(6, '2025_08_19_151807_create_purchases_table', 1),
(7, '2025_08_19_151911_create_purchase_items_table', 1),
(8, '2025_08_19_151958_create_sales_table', 1),
(9, '2025_08_19_152134_create_sale_items_table', 1),
(10, '2025_08_19_152313_create_prescriptions_table', 1),
(11, '2025_08_19_152414_create_prescription_items_table', 1),
(12, '2025_08_19_152456_create_notifications_table', 1),
(13, '2025_08_31_132331_create_order_table', 1),
(14, '2025_08_31_132342_create_orderitem_table', 1),
(15, '2025_09_03_122525_add_created_by_and_updated_by_to_order_table', 1),
(16, '2025_09_04_124322_create_archived_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('stock_low','expired','new_order') NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `pharmacist_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `created_by`, `updated_by`, `pharmacist_id`, `total_price`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 3, 32050.00, '2025-09-15 16:18:25', '2025-09-15 16:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `order_id`, `medicine_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 153, 100, 289.00, '2025-09-15 16:18:26', '2025-09-15 16:18:26'),
(2, 1, 5, 10, 315.00, '2025-09-15 16:18:26', '2025-09-15 16:18:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `doctor_name` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `pharmacist_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_items`
--

CREATE TABLE `prescription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prescription_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_type` enum('cash','card','insurance') NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2lmR8W7QehAruIxsRCYuABdr0x6qnPWtBIMfpY6F', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZzlnOXoxckNWanAzNUlGeDdoYkxYajlGR0pPUjRtVnUzVWRRTTVFRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlcnMvYWxsb3JkZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1757963906);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `company_name`, `created_at`, `updated_at`) VALUES
(1, 'mostafa ahmed metwally', 'mostafaahmed66223@gmail.com', '01022206850', 'mit abo khaled', 'medivcal', '2025-09-15 16:04:48', '2025-09-15 16:04:48'),
(2, 'Herman Pratt', 'seso@mailinator.com', '040000', 'Aliquid dolor at mol', 'Montoya Oneil Associates', '2025-09-15 16:13:05', '2025-09-15 16:13:05'),
(3, 'Noel Pruitt', 'reboxehydi@mailinator.com', '000611', 'Vel repellendus Aut', 'Petersen and Gill LLC', '2025-09-15 16:13:15', '2025-09-15 16:13:15'),
(4, 'Bertha Vaughn', 'sylu@mailinator.com', '010236592', 'Est amet vero proid', 'Fischer Allison LLC', '2025-09-15 16:13:24', '2025-09-15 16:13:24'),
(5, 'Alyssa Owen', 'fibice@mailinator.com', '01036492', 'Quisquam aut distinc', 'Morse Yang LLC', '2025-09-15 16:13:36', '2025-09-15 16:13:36'),
(6, 'Caleb Watson', 'puhetyj@mailinator.com', '01033265', 'Minim tempor sint ob', 'Soto and Kennedy Plc', '2025-09-15 16:13:45', '2025-09-15 16:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('admin','Pharmacist','Cashier','Supplier') NOT NULL DEFAULT 'admin',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'mostafa ahmed metwally', 'mostafaahmed66223@gmail.com', NULL, '$2y$12$s2jztypnUfAUi.6oGRy6PupESWuuib93tECudtg/i0XDlYER11dES', 'admin', '01022206850', 'mit abo khaled', NULL, '2025-09-15 16:02:40', '2025-09-15 16:02:40'),
(3, 'desha', 'desha@123', NULL, '$2y$12$v/CSPXh07bO1mFyr8n5ExewWguqQMGJGNwUzMbCpJDTgSAX8huqfu', 'Pharmacist', '01022206850', 'mit abo khaled', NULL, '2025-09-15 16:04:36', '2025-09-15 16:04:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archived_orders`
--
ALTER TABLE `archived_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medicines_barcode_unique` (`barcode`),
  ADD KEY `medicines_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_created_by_foreign` (`created_by`),
  ADD KEY `order_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptions_pharmacist_id_foreign` (`pharmacist_id`);

--
-- Indexes for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_items_prescription_id_foreign` (`prescription_id`),
  ADD KEY `prescription_items_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_items_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_user_id_foreign` (`user_id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_items_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_items_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archived_orders`
--
ALTER TABLE `archived_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription_items`
--
ALTER TABLE `prescription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `medicines_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_pharmacist_id_foreign` FOREIGN KEY (`pharmacist_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD CONSTRAINT `prescription_items_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prescription_items_prescription_id_foreign` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

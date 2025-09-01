# Picture Classification

Use the Picture Classification Rule Type when a field should be validated or derived from an image rather than text. The rule supports image-type validation (e.g., Signature, Fingerprint, Barcode, Face), object and web detections, Safe Search checks, text annotations, and visual similarity via image comparison with thresholds and optional HSV color filtering.

![Picture — base options](../../assets/img-2025-09-01-10-26-35.png)

---

## When to use

- Confirm an image field contains the expected content (e.g., signature present, barcode/QR present, a face in a selfie box).
- Enrich records with attributes derived from an image (e.g., face detection flags, best-guess category, web entities).
- Enforce policy and safety (e.g., block adult/violent content).
- Validate visual similarity, color presence, or shape features (e.g., brand mark, stamp, background color band).

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the Picture rule

![Picture — classification dropdown](../../assets/img-2025-09-01-10-26-53.png)

Core settings:

- Rule Type: Picture
- Default Value: The value to return when nothing is extracted (e.g., Empty Text).
- Picture Classification: Select the expected image type.

Available classifications:

- Empty
- Handwriting
- Signature
- Photo
- Document
- Barcode
- QRCode
- CheckMark
- Fingerprint
- Face
- Scene
- Other

Panels to enable/configure:

- Object Detection Options
- Image Comparison Options
- Signature Detection Options (visible only when Picture Classification = Signature)
- Fingerprint Detection Options (visible only when Picture Classification = Fingerprint)

---

## Input preparation and normalization (recommended)

- Ensure upright orientation (auto-rotate or manual rotate if needed).
- Prefer original or high-quality scans; avoid heavy compression.
- Crop to the region of interest if the target occupies a small area.
- Apply light deskew/denoise/contrast normalization for consistent detection across devices.

!!! tip "Consistent preprocessing"
    Use the same preprocessing pipeline across environments (scanner, mobile capture) to keep detection thresholds stable.

---

## Object Detection Options

![Picture — object detection (Face/Web/Safe/Text)](../../assets/img-2025-09-01-10-28-33.png)

Toggles:

- Face Detection
    - Face Detection Options
        - Detect Age — estimate age range.
        - Detect Gender — estimate gender presentation.
        - Detect Emotions — return emotions with likelihood/confidence.
        - Detect Landmarks — return facial landmarks (e.g., eyes, nose bridge).
        ![](../../assets/img-2025-09-01-10-29-12.png)

- Web Content Detection
    - Web Detection Options
        - Best Guess Category
        - Fully Matching Images
        - Pages with Matching Images
        - Partial Matching Images
        - Visually Similar Images
        - Web Entities
        ![](../../assets/img-2025-09-01-10-29-33.png)

- Safe Search
    - Safe Search Options
        - Adult
        - Landmarks (include landmark signals where applicable)
        - Allow racy content
        - Violence and Gore
        ![](../../assets/img-2025-09-01-10-29-39.png)

- Text Annotation
    - Text Annotation Options
        - Full Text — dense captions/paragraph-like text.
        - Text — short tags/captions.
        ![](../../assets/img-2025-09-01-10-29-45.png)

!!! warning "Responsible AI and privacy"
    Only enable face-related sub-attributes (age/gender/emotions) when legally justified and necessary. Restrict access and log overrides.

---

## Image Comparison Options

![Picture — image comparison](../../assets/img-2025-09-01-10-30-17.png)

Use visual similarity to check whether the image matches a reference pattern/logo or contains specific colors.

Parameters:

- Accuracy Value  
    Minimum similarity threshold (0.00–1.00). Scores below this fail or escalate.
    - The UI “+” control supports adding preset values or multiple reference profiles (where available).

- Filter Colors  
    Enable HSV color filtering before comparison to isolate target colors.

- Threshold Type  
    Method used before/with similarity (e.g., Default, edge/binary variants if present).

- Threshold Value  
    Numeric intensity/cutoff to pair with Threshold Type for noise suppression.

- HSV Lower Filter / HSV Upper Filter  
    One or more HSV ranges (H: 0–360 or 0–179 depending on implementation, S/V: 0–255). Add pairs to capture brand palettes.

!!! tip "Color-first, then shape"
    When validating logos/stamps with distinctive colors, tune HSV filters first to isolate the signal, then refine Thresholds and Accuracy.

---

## Signature Detection Options (when Picture Classification = Signature)

![Picture — signature detection options](../../assets/img-2025-09-01-10-32-00.png)

These parameters tune the internal signature detector for hand-drawn ink-like strokes and contours. Defaults cover most scanned signatures; adjust if you see false positives/negatives.

- Adaptive Block Size (default shown in UI example: 11.00)  
    Block size for adaptive thresholding; larger values smooth noise in coarse scans.  
    - Increase if the background is uneven or if strokes look broken.  
    - Decrease if fine strokes disappear.

- Curvature Coefficient (default: 2.00)  
    Emphasizes curved stroke continuity over straight edges.  
    - Increase to favor flowing cursive signatures.  
    - Decrease if stamps or straight artifacts are being misread as signatures.

- Contour Count Threshold (default: 35)  
    Minimum number of meaningful contours required to accept a signature.  
    - Raise to reduce false positives from small scribbles or marks.  
    - Lower if genuine signatures are short/initial-like.

- K Size (default: 9)  
    Kernel/window size for smoothing and feature extraction.  
    - Larger values smooth noise but can blur detail.  
    - Smaller values preserve detail but may admit noise.

- Threshold (default: 32.00)  
    Intensity threshold for binarization/edge extraction.  
    - Raise in bright scans to reduce background speckle.  
    - Lower if light-ink signatures are getting lost.

Recommended tuning flow:

1) Start with defaults; test 10–20 real samples (pass/fail).  
2) Adjust Adaptive Block Size and Threshold until stroke continuity looks stable.  
3) Use Contour Count Threshold to eliminate scribble false positives.  
4) Fine-tune Curvature Coefficient and K Size for cursive vs printed initials.

---

## Fingerprint Detection Options (when Picture Classification = Fingerprint)

![Picture — fingerprint detection options](../../assets/img-2025-09-01-10-32-13.png)

These parameters target ridge/valley prominence and corner/keypoint salience on fingerprints.

- Harris Corner Aperture Size (default: 3)  
    Aperture for the Sobel operator in the Harris detector.  
    - Increase to emphasize broader features; decrease for sharper edges.

- Harris Corner Block Size (default: 2)  
    Neighborhood size considered for corner detection.  
    - Larger sizes are more tolerant to noise but may merge fine ridge endings.

- Harris Corner Kparam (default: 0.02)  
    Harris detector sensitivity.  
    - Increase to detect more corners (risk: noise).  
    - Decrease to be conservative (risk: missing weak minutiae).

- Key Point Threshold (default: 50.00)  
    Minimum score for accepting a keypoint/minutiae candidate.  
    - Increase to reduce false positives in low-quality scans.  
    - Decrease if high-quality prints still under-detect minutiae.

Recommended tuning flow:

1) Normalize brightness/contrast first (consistent capture).  
2) Tune Kparam and Key Point Threshold to get a stable minutiae count on known-good samples.  
3) Adjust Aperture/Block Size to balance fine ridge detail vs noise.

---

## Output and formatting

The rule can emit:

- Booleans: e.g., SignatureDetected, FaceDetected, SafeSearchPassed.
- Enum/labels: PictureClass, BestGuessCategory.
- Numerics: DetectionConfidence, SimilarityScore.
- Objects/metadata: WebEntities list, Face.Emotions, landmark coordinates.

Use “Use Analytics Value/Confidence” (if available) to set the field value and confidence from analytics. Store richer JSON in metadata for audit, while surfacing a simple pass/fail or label to users.

---

## HITL triggers and reviewer guidance

Trigger review when:

- Expected class not detected (e.g., Signature = false, Fingerprint = false).
- Similarity/Accuracy score < threshold or within a borderline band (e.g., within ±0.05).
- Safe Search raises any blocked category, or detectors produce low confidence.
- Face detections violate policy (e.g., 0 faces or >1 face when exactly one is required).
- Web Detection suggests mismatches (e.g., “best guess” does not fit policy).

!!! example "Suggested reviewer note (HITL)"
    “Verify that the image content matches the expected type (e.g., Signature/Fingerprint). Review detection details and the similarity score against policy. If detections are ambiguous or quality is poor, confirm the image or replace it.”

---

## Examples

- Signature presence check  
    - Picture Classification: Signature  
    - Signature Detection Options: defaults  
    - Safe Search: On  
    - Result: SignatureDetected = true; SafeSearchPassed = true

- Fingerprint detection with stricter minutiae threshold  
    - Picture Classification: Fingerprint  
    - Harris Corner Kparam: 0.02 → 0.03; Key Point Threshold: 50 → 65  
    - Result: Fewer false positives; escalate if minutiae count < policy threshold.

- QR code confirmation + text  
    - Picture Classification: QRCode  
    - Text Annotation: Text = On  
    - Result: QRDetected = true; CodeText extracted; escalate if no code or unreadable.

- Logo verification (color + similarity)  
    - Picture Classification: Other  
    - Image Comparison: Filter Colors = On; HSV ranges for brand blue; Accuracy Value = 0.85  
    - Result: SimilarityScore = 0.90 → pass.

---

## Best practices

- Enable only the detectors that drive your decision to minimize noise and runtime.
- Tune thresholds with a representative validation set; document chosen values with examples.
- Use HSV color filtering for brand/stamp validation; keep ranges tight and test under varied lighting.
- Store full detection/threshold metadata for audit; display a single status to users.
- For sensitive attributes (face/age/gender), follow privacy-by-design: disable unless required, restrict access, and log overrides.

---

## Testing checklist

- [ ] Positive/negative samples for each chosen classification (Signature, Fingerprint, Face, etc.).  
- [ ] Threshold sweeps to set stable Accuracy and Key Point thresholds.  
- [ ] Safe Search scenarios (benign and borderline) in a controlled environment.  
- [ ] HSV ranges tested under different lighting/backgrounds.  
- [ ] Face counts and confidence handling (0, 1, >1).  
- [ ] HITL routing for borderline or conflicting detections.

---

## Troubleshooting

- Signature false positives (scribbles)  
    Raise Contour Count Threshold; increase Curvature Coefficient; adjust Threshold upward to reduce background noise.

- Signature missing (light ink)  
    Lower Threshold; reduce Adaptive Block Size slightly; decrease Contour Count Threshold if genuine signatures are brief.

- Fingerprint detects too many noisy keypoints  
    Increase Key Point Threshold; lower Kparam; slightly increase Block Size.

- Fingerprint under-detects minutiae  
    Decrease Key Point Threshold; increase Kparam; reduce Aperture/Block Size to preserve fine detail.

- Similarity unstable across lighting  
    Normalize exposure/contrast; refine HSV ranges; adjust Threshold Type/Value.

---

## UI reference

- Base panel (Rule Type, Default Value, Picture Classification)  
    ![Picture — base options](../../assets/img-2025-09-01-10-26-35.png)

- Classification dropdown (types)  
    ![Picture — classification dropdown](../../assets/img-2025-09-01-10-26-53.png)

- Object Detection Options (Face/Web/Safe/Text)  
    ![](../../assets/img-2025-09-01-10-29-12.png)
    ![](../../assets/img-2025-09-01-10-29-33.png)
    ![](../../assets/img-2025-09-01-10-29-39.png)
    ![](../../assets/img-2025-09-01-10-29-45.png)

- Image Comparison Options (accuracy, thresholds, HSV filters)  
    ![Picture — image comparison](../../assets/img-2025-09-01-10-30-17.png)

- Signature Detection Options (visible when classification = Signature)  
    ![Picture — signature detection options](../../assets/img-2025-09-01-10-32-00.png)

- Fingerprint Detection Options (visible when classification = Fingerprint)  
    ![Picture — fingerprint detection options](../../assets/img-2025-09-01-10-32-13.png)
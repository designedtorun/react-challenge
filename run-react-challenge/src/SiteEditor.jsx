import * as React from "react";
import { useState, useEffect } from "react";
import {
  Box,
  CircularProgress,
  Grid,
  Typography,
  Container,
  InputLabel,
  FormControl,
  Select,
  MenuItem,
  TextField,
  CssBaseline,
  Button,
} from "@mui/material";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import {
  supabase,
  upsertBodyCopy,
  upsertHeadline,
  upsertUrl,
} from "../utils/supabase";

const defaultTheme = createTheme();

export default function SiteEditor() {
  const [isLoading, setIsLoading] = useState(true);

  const [allSites, setAllSites] = useState([]); // [site1, site2, site3]
  const [activeSite, setActiveSite] = useState({ site_name: "" });
  const [siteDetails, setSiteDetails] = useState({
    headline: "",
    url: "",
    bodyCopy: "",
  });

  /* Fetch all sites */
  useEffect(() => {
    async function getSites() {
      let { data: Sites, error } = await supabase.from("Site").select("*");

      setAllSites(Sites);
      setIsLoading(false);
    }

    getSites();
  }, []);

  /* Handle form submission */
  const handleSubmit = (event) => {
    event.preventDefault();
    /*
    TODO: Handle adding versions
    */
  };

  /* Handle selecting site from dropdown */
  const handleSiteSelect = async (event) => {
    setIsLoading(true); // Start loading

    let { data: Site, error } = await supabase
      .from("Site")
      .select("*")
      .eq("site_name", event.target.value);

    setActiveSite(Site[0]);

    let { data: Headline } = await supabase
      .from("Headline")
      .select("*")
      .eq("site_id", Site[0].id);

    let { data: Url } = await supabase
      .from("URL")
      .select("*")
      .eq("site_id", Site[0].id);

    let { data: BodyCopy } = await supabase
      .from("BodyCopy")
      .select("*")
      .eq("site_id", Site[0].id);

    setSiteDetails({
      headline: Headline[0].text,
      url: Url[0].text,
      bodyCopy: BodyCopy[0].text,
    });

    setIsLoading(false); // Loading is complete
  };

  return (
    <ThemeProvider theme={defaultTheme}>
      <Container component="main" maxWidth="xs">
        <CssBaseline />
        <Box
          sx={{
            marginTop: 8,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
          }}
        >
          <Typography component="h1" variant="h5">
            RUN! React Challenge
          </Typography>
          <Box
            component="form"
            noValidate
            onSubmit={handleSubmit}
            sx={{ mt: 3 }}
          >
            <Grid container spacing={2}>
              <Grid item xs={12}>
                <FormControl sx={{ width: "100%" }}>
                  <InputLabel id="demo-simple-select-autowidth-label">
                    Select Site
                  </InputLabel>
                  <Select
                    fullWidth
                    labelId="demo-simple-select-autowidth-label"
                    id="demo-simple-select-autowidth"
                    value={activeSite.site_name || ""}
                    label="Select Site"
                    name="Site"
                    onChange={handleSiteSelect}
                  >
                    {allSites.map((site) => (
                      <MenuItem key={site.id} value={site.site_name}>
                        {site.site_name}
                      </MenuItem>
                    ))}
                  </Select>
                </FormControl>
              </Grid>
              <Grid item xs={12}>
                <TextField
                  fullWidth
                  id="headline"
                  label="Headline"
                  name="headline"
                  value={siteDetails.headline}
                  onChange={(e) =>
                    setSiteDetails({ ...siteDetails, headline: e.target.value })
                  }
                  onBlur={(e) => upsertHeadline(e.target.value, activeSite.id)}
                  InputLabelProps={{
                    shrink: true,
                  }}
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  fullWidth
                  id="url"
                  label="URL"
                  name="url"
                  value={siteDetails.url}
                  onChange={(e) =>
                    setSiteDetails({ ...siteDetails, url: e.target.value })
                  }
                  onBlur={(e) => upsertUrl(e.target.value, activeSite.id)}
                  InputLabelProps={{
                    shrink: true,
                  }}
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  fullWidth
                  id="body-copy"
                  label="Body Copy"
                  name="body-copy"
                  multiline
                  value={siteDetails.bodyCopy}
                  onChange={(e) =>
                    setSiteDetails({ ...siteDetails, bodyCopy: e.target.value })
                  }
                  onBlur={(e) => upsertBodyCopy(e.target.value, activeSite.id)}
                  InputLabelProps={{
                    shrink: true,
                  }}
                />
              </Grid>
            </Grid>
            <Button
              type="submit"
              fullWidth
              variant="contained"
              sx={{ mt: 3, mb: 2 }}
            >
              Save Version
            </Button>
          </Box>
        </Box>
        <Box sx={{ mt: 2 }}>
          <Typography variant="body1" align="left">
            Revert to saved version:
            <br />
            (List of saved versions here)
          </Typography>
        </Box>
      </Container>
      {isLoading && (
        <Box
          sx={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            backgroundColor: "white",
            position: "absolute",
            width: "100vw",
            height: "100vh",
            top: 0,
            left: 0,
            zIndex: 5,
            opacity: 0.5,
          }}
        >
          <CircularProgress />
        </Box>
      )}
    </ThemeProvider>
  );
}
